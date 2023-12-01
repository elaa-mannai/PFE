import { Module } from '@nestjs/common';
import { ChatService } from './chat.service';
import { ChatController } from './chat.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { chatSchema } from './entities/chat.entity';
import { userSchema } from 'src/users/entities/user.entity';

@Module({
  imports:[MongooseModule.forFeature([{name:'chats', schema:chatSchema}]),
  MongooseModule.forFeature([{name:'users', schema:userSchema}])],
  controllers: [ChatController],
  providers: [ChatService],
})
export class ChatModule {}
