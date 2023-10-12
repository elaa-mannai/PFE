import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument, SchemaTypes, Types } from "mongoose";


export type CustomerDocument = HydratedDocument<Customer>
@Schema()
export class Customer {

    @Prop({ required: false })
    items: string


    @Prop({ required: false, type: SchemaTypes.ObjectId, ref: 'guests' })
    guest: Types.ObjectId

}

export const customerSchema = SchemaFactory.createForClass(Customer)
