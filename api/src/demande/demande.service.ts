import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateDemandeDto } from './dto/create-demande.dto';
import { UpdateDemandeDto } from './dto/update_demande.dto';
import { InjectModel } from '@nestjs/mongoose';
import Module from 'module';
import { IDemande } from './interfaces/demande.interface';
import { IEvent } from 'src/events/interfaces/event.interface';
import { Model } from 'mongoose';
import { IUser } from 'src/users/interfaces/user.interface';
import { IProduct } from 'src/products/interface/product.interface';

@Injectable()
export class DemandeService {

    constructor(
        
        @InjectModel('demande')
        private demandeModel:Model<IDemande>,

        @InjectModel('events')
        private eventModel:Model<IEvent>,

        @InjectModel('users')
        private userModel:Model<IUser>,
        
        @InjectModel('products')
        private productModel:Model<IProduct>,
    ){}

    async create(createDemandeDto: CreateDemandeDto): Promise<IDemande> {
        const newdemande = new this.demandeModel(createDemandeDto)
        await this.eventModel.updateOne({_id: createDemandeDto.events}
            ,{$push: {demande: newdemande._id}})
            await this.userModel.updateOne({_id: createDemandeDto.user}
                ,{$push: {demande: newdemande._id}})
                await this.productModel.updateOne({_id: createDemandeDto.user}
                    ,{$push: {demande: newdemande._id}})
            
        return await newdemande.save() 
      }
    
      async findAll(): Promise<IDemande[]> {
    const data = await this.demandeModel.find().exec()
    if (!data || data.length === 0) {
      throw new NotFoundException("demande Data not found")
    }
    return data
  }
  async findOne(id: string): Promise<IDemande> {
    const data = await this.demandeModel.findById(id).exec()
    if (!data) {
      throw new NotFoundException("demande Data not found")
    }
    return data
  }
    
     
  async update(id: string, updateDemandeDto: UpdateDemandeDto) {
    const data = await this.demandeModel.findByIdAndUpdate(id, updateDemandeDto, { new: true });
    if (!data) {
      throw new NotFoundException("demande not found ")
    }
    return data
  }
    
  async remove(id: string) {
    const data = await this.demandeModel.findByIdAndDelete(id);
    console.log(data)
    
    
    await this.eventModel.updateOne({_id: data.events}, {$pull:{demande:data._id}})

    if (!data) {
      throw new NotFoundException('demande not found')
    }
    return data
  }
}
