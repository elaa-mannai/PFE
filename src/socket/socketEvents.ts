import { SubscribeMessage, WebSocketGateway, MessageBody, WebSocketServer, ConnectedSocket } from "@nestjs/websockets";
import { Server, Socket } from "socket.io";
import { ChatService } from "src/chat/chat.service";

@WebSocketGateway({
    cors: {
        origin: '*'
    }
    
})


export class SocketEvents {
    @WebSocketServer()
    server: Server;
    constructor(private readonly chatService: ChatService) {}

    createRoom(data: string, client: Socket) {
        client.join(data);
        return { event: 'message', room: 'room' };

    }
    //connection
    // handleConnection(client: Socket) {
    //     //this.createRoom("room", client);
    //     // client.on("message", (socket) => {
    //     //     // join a single room
    //     // //    socket.join("room1");
    //     // console.log(`connect================${socket.id}`)
    //     // })
    //     console.log(`client connected: ${client.id}`);

    // }

    handleConnection(client: Socket) {
        this.createRoom("room", client);
        console.log(`client connected: ${client.id}`);

    }
    //deconnection
    handleDisconnect(client: Socket) {
        console.log(`client disconnected: ${client.id}`);

    }

    //receive envent
    @SubscribeMessage('message')
    handleEvent(@MessageBody() data: string, room: string, @ConnectedSocket() client: Socket) {
        // this.server.emit('message', client.id, { room: room, message: data },)
        this.server.emit('message', data)
    }

    // @SubscribeMessage('message')
    // async handleEvent(@MessageBody() data: string, room: string, @ConnectedSocket() client: Socket):Promise<void> {
    //     const savedMessage = await this.chatService.create;
    //     this.server.emit('message', savedMessage)
    // }
}
