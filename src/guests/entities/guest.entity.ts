import { Schema, Prop, SchemaFactory } from "@nestjs/mongoose";
import { SchemaTypes, Types } from "mongoose";

@Schema()
export class Guest {

    @Prop({ required: true })
    name: string

    @Prop({ required: true })
    invited: boolean
    
    @Prop({required:true, type: SchemaTypes.ObjectId, ref:'users'})
    user: Types.ObjectId   
   
}

export const guestschema = SchemaFactory.createForClass(Guest);
