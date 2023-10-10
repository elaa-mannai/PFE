import { Schema, Prop, SchemaFactory } from "@nestjs/mongoose";
import { SchemaTypes, Types } from "mongoose";

@Schema()
export class Event {

    @Prop({ required: true })
    titleevent: string

    @Prop({ required: true })
    description: string

    @Prop({ required: true })
    date_debut: Date

    @Prop({ required: true })
    date_fin: Date
    
    @Prop({ required: true })
    local: string
    
    @Prop({ required: true })
    budget: number
    
    @Prop({required:true, type: SchemaTypes.ObjectId, ref:'users'})
    user: Types.ObjectId

   

}

export const eventSchema = SchemaFactory.createForClass(Event);

