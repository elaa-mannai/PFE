import { Document } from "mongoose";

export interface IGuest extends Document {

    readonly name : string
    readonly phonenumber: number
    readonly invited: boolean
    readonly events: string
   
}