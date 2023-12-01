import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateChatDto } from './dto/create-chat.dto';
import { UpdateChatDto } from './dto/update-chat.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { IUser } from 'src/users/interfaces/user.interface';
import { IChat } from './interface/chat.interface';

@Injectable()
export class ChatService {

  constructor(  
    @InjectModel('chats')
    private chatboxModel: Model<IChat>,
  
    @InjectModel('users')
  private userModel: Model<IUser>,
){}

 async create(createChatDto: CreateChatDto):Promise<IChat> {
  const newchat = new this.chatboxModel(createChatDto)
  await this.userModel.updateOne({_id:createChatDto.sender}, {$push:{chats:newchat._id}});
  await this.userModel.updateOne({_id:createChatDto.reciever}, {$push:{chats:newchat._id}});
  return await newchat.save()
}

  async findAll():Promise<IChat[]> {
    const data = await this.chatboxModel.find()
  
    if (!data || data.length === 0) {
      return null
    }
    return  data;  }

 async findOneByIdChat(idSender: string):Promise<IChat> {
  const data = await this.chatboxModel.findById(idSender)
  if (!data) {
    throw new NotFoundException("Chat not found")
  }
  return data
}

async findOneByReciever(idReciever: string):Promise<IChat> {
  const data = await this.chatboxModel.findOne({reciever:idReciever})
  if (!data) {
    throw new NotFoundException("Chat not found")
  }
  return data
}

async findOneBySender(idSender: string):Promise<IChat> {
  const data = await this.chatboxModel.findOne({sender:idSender})
  if (!data) {
    throw new NotFoundException("Chat not found")
  }
  return data
}


async findByRecieverAndSender(idReciever: string,idSender: string):Promise<IChat[]> {
  const data = await this.chatboxModel.find({reciever:idReciever, sender:idSender})
  if (!data) {
    throw new NotFoundException("Chat not found")
  }
  return data
}



  update(id: number, updateChatDto: UpdateChatDto) {
    return `This action updates a #${id} chat`;
  }

  remove(id: number) {
    return `This action removes a #${id} chat`;
  }
}
