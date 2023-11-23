import { Document } from "mongoose";

export interface IDemande extends Document {
    readonly user:string
    readonly products:string
    readonly events: string
    readonly state: boolean
}