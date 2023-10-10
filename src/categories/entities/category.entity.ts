import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose"
import { SchemaTypes, Types } from "mongoose";

@Schema()
export class Category {

    @Prop({required:true})
    name:string
 
    @Prop([{required:true, type: SchemaTypes.ObjectId, ref:'products'}])
    products: Types.ObjectId[]

    
}

export const CategorieSchema = SchemaFactory.createForClass(Category);

