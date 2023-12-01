import { Controller, Get, Post, Body, Patch, Param,Res, Delete, HttpStatus } from '@nestjs/common';
import { ChatService } from './chat.service';
import { CreateChatDto } from './dto/create-chat.dto';
import { UpdateChatDto } from './dto/update-chat.dto';
import { ApiTags } from '@nestjs/swagger';
import { IChat } from './interface/chat.interface';

@Controller('chats')
@ApiTags('chats')
export class ChatController {
  constructor(private readonly chatService: ChatService) {}

  @Post()
  async create(@Body() createChatDto: CreateChatDto, @Res() response) {
    try {
      const newchat =  await this.chatService.create(createChatDto)
      return response.status(HttpStatus.CREATED).json({
        message: 'Chatbox created successfully',
        status: HttpStatus.CREATED,
        data: newchat
      })
    } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
        message: error.message,
        status: HttpStatus.BAD_REQUEST,
        data: null
      })
    } 
  }

  @Get('stateAndUserId/:idReciever/:idSender')
 async GetChatBySenderAndReciever (@Param('idReciever') idReciever: string ,@Param('idSender') idSender : string,@Res() response): Promise<IChat>{
 try{
  const favoriteDate = await this.chatService.findByRecieverAndSender( idReciever,idSender )
  return response.status(HttpStatus.OK).json({
    message:"Chat by Sender and Reciever found successfully",
    status:HttpStatus.OK,
    data:favoriteDate
  })
 }catch
  (error){
    return response.status(HttpStatus.BAD_REQUEST).json({
      message:error.message,
      status:HttpStatus.BAD_REQUEST,
      data:null
    })
 } 
 }

  @Get()
 async findAll(@Res() response) {
  try {
    const data = await this.chatService.findAll()
    return response.status(HttpStatus.OK).json({
      message: "Chat found successfully",
      status: HttpStatus.OK,
      data: data
    })

  } catch (error) {
    return response.status(HttpStatus.BAD_REQUEST).json({
      message: error.message,
      status: HttpStatus.BAD_REQUEST,
      data: null
    })
  }
  }

  @Get('Chat/:id')
  async findOneByIdChat(@Param('id') id: string, @Res() response) {
    try {
      const Pdata = await this.chatService.findOneByIdChat(id)
      return response.status(HttpStatus.OK).json({
        message: "Chat Sender found successfully",
        status: HttpStatus.OK,
        data: Pdata
      })

    } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
        message: error.message,
        status: HttpStatus.BAD_REQUEST,
        data: null
      })
    }  
  }
  @Get('Reciever/:idReciever')
  async findOneByRecier(@Param('idReciever') idReciever: string, @Res() response) {
    try {
      const Pdata = await this.chatService.findOneByReciever(idReciever)
      return response.status(HttpStatus.OK).json({
        message: "Chat Reciever found successfully",
        status: HttpStatus.OK,
        data: Pdata
      })

    } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
        message: error.message,
        status: HttpStatus.BAD_REQUEST,
        data: null
      })
    }  
  }

  @Get('Sender/:idSender')
  async findOneBySender(@Param('idSender') idSender: string, @Res() response) {
    try {
      const Pdata = await this.chatService.findOneBySender(idSender)
      return response.status(HttpStatus.OK).json({
        message: "Chat Sender found successfully",
        status: HttpStatus.OK,
        data: Pdata
      })

    } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
        message: error.message,
        status: HttpStatus.BAD_REQUEST,
        data: null
      })
    }  
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateChatDto: UpdateChatDto) {
    return this.chatService.update(+id, updateChatDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.chatService.remove(+id);
  }
}
