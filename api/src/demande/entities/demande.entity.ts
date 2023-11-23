import { Schema, Prop, SchemaFactory } from "@nestjs/mongoose";
import { SchemaTypes, Types } from "mongoose";

@Schema()
export class Demande {

    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'users'})
    user: Types.ObjectId

    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'products'})
    products: Types.ObjectId

    @Prop({required:false, type: SchemaTypes.ObjectId, ref:'events'})
    events: Types.ObjectId

    @Prop({ required: false })
    state: boolean
}
export const demandeSchema = SchemaFactory.createForClass(Demande);
