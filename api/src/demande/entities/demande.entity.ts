import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { SchemaTypes, Types } from "mongoose";

@Schema()
export class Demande {
    @Prop({required:false})
    state:Boolean

    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'users'})
    vendor: Types.ObjectId
 
    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'products'})
    products: Types.ObjectId

    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'users'})
    users: Types.ObjectId

    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'events'})
    events: Types.ObjectId
}
export const demandeSchema = SchemaFactory.createForClass(Demande)

