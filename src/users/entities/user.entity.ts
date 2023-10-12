import { Schema, Prop, SchemaFactory } from "@nestjs/mongoose";
import * as argon2 from 'argon2'
import { timeStamp } from "console";
import { HydratedDocument, SchemaTypes, Types } from 'mongoose';
import { Admin } from "src/admin/entities/admin.entity";
import { Customer } from "src/customers/entities/customer.entity";
import { Vendor } from "src/vendors/entities/vendor.entity";


export type UserDocument = HydratedDocument<User>
@Schema({timestamps:true})
export class User {

    @Prop({ required:false, enum:[ Customer.name, Vendor.name, Admin.name]})
    items:string


    @Prop({ required: false })
    username: string

    @Prop({ required: false })
    email: string

    @Prop({ required: false })
    password: string

    @Prop({ required: false })
    city: string

    @Prop({ required: false })
    adress: string

    @Prop({ required: false })
    phone: number

    @Prop({ required: false })
    image: string
  
   @Prop({ required: false })
    refreshToken: string

    @Prop([{ required: false , type: SchemaTypes.ObjectId, ref:'events'}])
    events: Types.ObjectId[]

    @Prop([{ required: false , type: SchemaTypes.ObjectId, ref:'products'}])
    products: Types.ObjectId[]

    @Prop([{ required: false , type: SchemaTypes.ObjectId, ref:'guests'}])
    guests: Types.ObjectId[]

  
}

export const userSchema = SchemaFactory.createForClass(User).pre('save',
    async function () {
        this.password = await argon2.hash(this.password)
    })
