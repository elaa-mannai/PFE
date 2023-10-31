import { Schema, Prop, SchemaFactory } from "@nestjs/mongoose";
import { SchemaTypes, Types } from "mongoose";

@Schema()
export class Favorite {

    @Prop({ required: false})
    state: boolean

    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'users'})
    user: Types.ObjectId

    
    @Prop({ required: false , type: SchemaTypes.ObjectId, ref:'products'})
    products: Types.ObjectId

}

export const favoriteSchema = SchemaFactory.createForClass(Favorite)

