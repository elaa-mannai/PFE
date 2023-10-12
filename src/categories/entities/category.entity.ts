import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose"
import { SchemaTypes, Types } from "mongoose";

@Schema()
export class Category {

    @Prop({required:false})
    name:String
 
    @Prop([{required:false, type: SchemaTypes.ObjectId, ref:'products'}])
    products: Types.ObjectId[]

    
}

export const CategorieSchema = SchemaFactory.createForClass(Category);

