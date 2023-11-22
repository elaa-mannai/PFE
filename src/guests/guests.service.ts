import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateGuestDto } from './dto/create-guest.dto';
import { UpdateGuestDto } from './dto/update-guest.dto';
import { InjectModel } from '@nestjs/mongoose';
import { IGuest } from './interfaces/guest.interface';
import { Model } from 'mongoose';
import { IUser } from 'src/users/interfaces/user.interface';
import { IEvent } from 'src/events/interfaces/event.interface';

@Injectable()
export class GuestsService {

  constructor(
    @InjectModel('guests')
  private guestModel: Model<IGuest> ,
  @InjectModel('events')
  private eventModel: Model<IEvent>,

) { }


  async createGuest(createGuestDto: CreateGuestDto): Promise<IGuest> {
    const newGuest = new this.guestModel(createGuestDto)
    await this.eventModel.updateOne({ _id: createGuestDto.events },
      {$push: {guests :newGuest._id}})

    return await newGuest.save()
  }

  

  async findAllGuests(): Promise<IGuest[]> {
    const data = await this.guestModel.find().exec()
    if (!data || data.length === 0) {
      throw new NotFoundException("Guest Data not found")
    }
    return data
  }

  async findOneGuest(id: string): Promise<IGuest> {
    const data = await this.guestModel.findById(id).exec()
    if (!data) {
      throw new NotFoundException("Guest Data not found")
    }
    return data
  }

  async updateGuest(id: string, updateGuestDto: UpdateGuestDto) {
    const data = await this.guestModel.findByIdAndUpdate(id, updateGuestDto, { new: true });
    if (!data) {
      throw new NotFoundException("Guest not found ")
    }
    return data
  }

  async removeGuest(id: string) {
    const data = await this.guestModel.findByIdAndDelete(id);
    console.log(data)
    
    
    await this.eventModel.updateOne({_id: data.events}, {$pull:{guests:data._id}})

    if (!data) {
      throw new NotFoundException('Guest not found')
    }
    return data
  }
//////////////////
/* async findAllGuestsByuser(UserId: string):Promise<IGuest[]>
{
  const GuestsData= await this.guestModel.find({user :UserId})
  if (!GuestsData || GuestsData.length ==0 ){
 return null
  }
    return GuestsData;
  }
 */
  async findAllGuestsByEventId(EventId: string):Promise<IGuest[]>
{
  const GuestsData= await this.guestModel.find({events :EventId})
  if (!GuestsData || GuestsData.length ==0 ){
 return null
  }
    return GuestsData;
  }
  
}
