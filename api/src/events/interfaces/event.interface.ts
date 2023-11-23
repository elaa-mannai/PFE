import { Document } from "mongoose";

export interface IEvent extends Document {

    readonly titleevent: string
    readonly description: string
    readonly date_debut:Date
    readonly date_fin:Date
    readonly local:string
    readonly budget:number
    readonly user: string
   /* readonly guests:string[]
    readonly guests:string
       //// list product favorite
    readonly products:string */
}