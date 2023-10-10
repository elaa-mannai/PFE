import { Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument } from "mongoose";


export type VendorDocument = HydratedDocument<Vendor>
@Schema()
export class Vendor {
items: string

}

export const vendorSchema = SchemaFactory.createForClass(Vendor)
