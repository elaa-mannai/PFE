import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateDemandeDto } from './dto/create-demande.dto';
import { UpdateDemandeDto } from './dto/update-demande.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { IProduct } from 'src/products/interface/product.interface';
import { IEvent } from 'src/events/interfaces/event.interface';
import { IUser } from 'src/users/interfaces/user.interface';
import { IDemande } from './interface/demande.interface';

@Injectable()
export class DemandeService {
  constructor(
    
    @InjectModel('demande')
    private demandeModel: Model<IDemande>,
    @InjectModel('products')
    private productModel: Model<IProduct>,
    @InjectModel('events')
    private eventModel: Model<IEvent>,
    @InjectModel('users')
      private userModel: Model<IUser>,
    ) {
  
    }

  async create(createDemandeDto: CreateDemandeDto):Promise<IDemande> {
const newD = new this.demandeModel(createDemandeDto)
await this.userModel.updateOne({_id: createDemandeDto.users},
  {$push:{demande:newD._id}}).populate;
  await this.eventModel.updateOne({_id: createDemandeDto.events},
    {$push:{demande:newD._id}}).populate;
    await this.productModel.updateOne({_id: createDemandeDto.products},
      {$push:{demande:newD._id}}).populate;
  return await newD.save()
  }

    
  async getDemandeByUserIdAndStateUrl(userId: string, state : boolean):Promise<IDemande[]>{
    const DemandeByUserIdAndStateUrl= await this.demandeModel.find({users :userId,state}).populate({path: 'products', populate:[{path:'user'}]}).populate({path:'users'}).populate({path:'events'}).exec(); 
  

    if (!DemandeByUserIdAndStateUrl || DemandeByUserIdAndStateUrl.length ==0 ){
   return null
    }
      return DemandeByUserIdAndStateUrl;
  }


  async findAll(): Promise<IDemande[]> {
    const data = await this.demandeModel.find().populate({path: 'products', populate:[{path:'user'}]}).populate({path:'users'}).populate({path:'events'}).exec(); 
  
    if (!data || data.length === 0) {
      //throw new NotFoundException("Demande Data not found")
      return null
    }
    return  data;
  }

 async findOne(id: string):Promise<IDemande> {
     // const pdata = await this.productModel.findById(productId).populate({path:'products', populate:[{path: 'favorites'},{path :'category'}]}).exec(); 
     const data = await this.demandeModel.findById(id)
     if (!data) {
       throw new NotFoundException("Demande not found")
     }
     return data
  }

  async update(id: string, updateDemandeDto: UpdateDemandeDto) {
    const pdata = await this.demandeModel.findByIdAndUpdate(id, updateDemandeDto, { new: true });
    if (!pdata) {
      throw new NotFoundException("Demande not found ")
    }
    return pdata   }

 async remove(id: string) {
    const pdata= await this.demandeModel.findByIdAndDelete(id);

    await this.productModel.updateOne({_id: pdata.products}, {$pull:{demande:pdata._id}})
    await this.userModel.updateOne({_id: pdata.user}, {$pull:{demande:pdata._id}})
    await this.eventModel.updateOne({_id: pdata.events}, {$pull:{demande:pdata._id}})

    if (!pdata) {
      throw new NotFoundException('Demande not found')
    }
    return pdata
  }
  ///////////////////////////////////////////////////

  async findAllDemandeByuser(UserId: string):Promise<IDemande[]>
  {
    const data= await this.demandeModel.find({users :UserId})
    if (!data || data.length ==0 ){
   return null
    }
      return data;
    }

  // async findAllDemandeByEvent(eventid: string):Promise<IDemande[]>
  // {
  //   const data= await this.demandeModel.find({events :eventid})
  //   if (!data || data.length ==0 ){
  //  return null
  //   }
  //     return data;
  //   }


}
