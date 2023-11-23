import { Schema, Prop, SchemaFactory } from "@nestjs/mongoose";
import { SchemaTypes, Types } from "mongoose";

@Schema()
export class Event {

    @Prop({ required: false })
    titleevent: string

    @Prop({ required: false })
    description: string

    @Prop({ required: false })
    date_debut: Date

    @Prop({ required: false })
    date_fin: Date
    
    @Prop({ required: false })
    local: string
    
    @Prop({ required: false })
    budget: number
    
    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'users'})
    user: Types.ObjectId

   
    @Prop([{ required: false , type: SchemaTypes.ObjectId, ref:'guests'}])
    guests: Types.ObjectId[]

    //// list product favorite
   @Prop({required:false, type: SchemaTypes.ObjectId, ref:'products'})
   products: Types.ObjectId[]

}

export const eventSchema = SchemaFactory.createForClass(Event);

