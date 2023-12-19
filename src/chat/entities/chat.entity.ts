import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose"
import {   SchemaTypes, Types } from "mongoose"

@Schema()
export class Chat {
    @Prop({required: false})
    messages:string[];
  
    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'users'})
    sender:Types.ObjectId
   
    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'users'})
    reciever:Types.ObjectId
}
export const chatSchema = SchemaFactory.createForClass(Chat)

