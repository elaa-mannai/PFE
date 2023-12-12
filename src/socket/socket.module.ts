import { Module } from '@nestjs/common';
import { SocketEvents } from './socketEvents';
import { ChatModule } from 'src/chat/chat.module';
@Module({
    imports: [ChatModule],
    providers:[SocketEvents]
})
export class SocketModule{}