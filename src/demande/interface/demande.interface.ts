import { Document } from "mongoose";

export interface IDemande extends Document{
    readonly state:boolean
    readonly user:string
    readonly vendor:string
    readonly products: string
    readonly events:string
}