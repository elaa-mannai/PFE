import { Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument } from "mongoose";


export type AdminDocument = HydratedDocument<Admin>
@Schema()
export class Admin {
items: string



}

export const adminSchema = SchemaFactory.createForClass(Admin)
