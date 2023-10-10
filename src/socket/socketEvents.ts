import { SubscribeMessage, WebSocketGateway, MessageBody, WebSocketServer, ConnectedSocket } from "@nestjs/websockets";
import { Server, Socket } from "socket.io";

@WebSocketGateway({
    cors: {
        origin: '*'
    }
})

export class SocketEvents {
    @WebSocketServer()
    server: Server;

    createRoom(data: string, client: Socket) {
        client.join(data);
        return { event: 'message', room: 'room' };

    }
    //connection
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
        this.server.emit('message', client.id, { room: room, message: data },)
    }

}
