import { Document } from "mongoose";

export interface IProduct extends Document {

    readonly nameproduct: string
    readonly description:string
    readonly price: number
    readonly location:string
    readonly image: string
    readonly category: string
    readonly user: string
    readonly favorites: string

}