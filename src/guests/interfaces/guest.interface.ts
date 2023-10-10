import { Document } from "mongoose";

export interface IGuest extends Document {

    readonly name : string
    readonly invited: boolean

   
}