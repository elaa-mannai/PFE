import { Document } from "mongoose";

export interface IFavorite extends Document {

    readonly state: Boolean
    readonly products: String
    readonly user: string
   
}