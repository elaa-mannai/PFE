import { Document } from "mongoose";

export interface IProduct extends Document {

    readonly nameproduct: string
    readonly description:string
    readonly price: number
    readonly image: string
    readonly category: string
    readonly user: string
}