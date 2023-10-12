import { Schema, Prop, SchemaFactory } from "@nestjs/mongoose";
import { SchemaTypes, Types } from "mongoose";

@Schema()
export class Guest {

    @Prop({ required: false })
    name: string

    @Prop({required: false})
    phonenumber: number
    
    @Prop({ required: false })
    invited: boolean
    
    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'events'})
    events: Types.ObjectId
   
}

export const guestschema = SchemaFactory.createForClass(Guest);
