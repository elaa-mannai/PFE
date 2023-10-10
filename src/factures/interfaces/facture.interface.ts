import { Document } from "mongoose";

export interface IFacture extends Document {

    readonly date_facture:Date
    readonly total:number
    readonly event: string
   
}