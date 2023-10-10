import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateEventDto } from './dto/create-event.dto';
import { UpdateEventDto } from './dto/update-event.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { IEvent } from './interfaces/event.interface';
import { IUser } from 'src/users/interfaces/user.interface';

@Injectable()
export class EventsService {
  constructor(@InjectModel('events')
  private eventModel: Model<IEvent>,
    @InjectModel('users')
    private userModel: Model<IUser>
  ) { }
  


  async createEvent(createEventDto: CreateEventDto): Promise<IEvent> {
    const newEvent = new this.eventModel(createEventDto)
    await this.userModel.updateOne({ _id: createEventDto.user },
      { $push: { events: newEvent._id } })

    return await newEvent.save()
  }

  async findAllEvents(): Promise<IEvent[]> {
    const EventData = await this.eventModel.find().exec()
    if (!EventData || EventData.length === 0) {
     // throw new NotFoundException("Events Data not found")
     return null
    }
    return EventData
  }

  async findOneEvent(eventId: string): Promise<IEvent> {
    const exsitingEvent = await this.eventModel.findById(eventId).exec()
    if (!exsitingEvent) {
      throw new NotFoundException("Event not found")
    }
    return exsitingEvent
  }

  async updateEvent(eventId: string, updateEventDto: UpdateEventDto): Promise<IEvent> {
    const updateEvent = await this.eventModel.findByIdAndUpdate(eventId, updateEventDto, { new: true });
    if (!updateEvent) {
      throw new NotFoundException("Event not found ")
    }
    return updateEvent
  }

  async deleteEventById(eventId: string): Promise<IEvent> {
    const deleteEvent = await this.eventModel.findByIdAndDelete(eventId);
    await this.userModel.updateOne({_id: deleteEvent.user}, {$pull:{events:deleteEvent._id}})
    if (!deleteEvent) {
      throw new NotFoundException('Event not found')
    }
    return deleteEvent
  }



////////////////////
  async findAllEventsByuser(UserId: string):Promise<IEvent[]>
    {
      const EventData= await this.eventModel.find({user :UserId})
      if (!EventData || EventData.length ==0 ){
     return null
      }
        return EventData;
      }
}
