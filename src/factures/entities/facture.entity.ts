import { Schema, Prop, SchemaFactory } from "@nestjs/mongoose";
import { SchemaTypes, Types } from "mongoose";

@Schema()
export class Facture {

    @Prop({ required: true })
    date_facture: Date

    @Prop({ required: true })
    total: number

    @Prop({required:true, type: SchemaTypes.ObjectId, ref:'events'})
    event: Types.ObjectId   
}

export const factureSchema = SchemaFactory.createForClass(Facture);
