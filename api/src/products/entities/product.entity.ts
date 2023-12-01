import { Schema, Prop, SchemaFactory } from "@nestjs/mongoose";
import {  SchemaTypes, Types } from "mongoose";

@Schema()
export class Product {

    @Prop({ required: false })
    nameproduct: string

    @Prop({ required: false })
    description: string

    @Prop({ required: false })
    price: number

    @Prop({required :false})
    location:string

    @Prop({ required: false })
    images: string[]

    @Prop({ required: false , type: SchemaTypes.ObjectId, ref:'categories'})
    category: Types.ObjectId

    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'users'})
    user: Types.ObjectId
    
    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'favorites'})
    favorites: Types.ObjectId


    
}
export const productSchema = SchemaFactory.createForClass(Product)


