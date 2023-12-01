import { Document } from "mongoose";

export interface IChat extends Document{
    readonly message:string
    // readonly users:string
    readonly sender:string
    readonly reciever: string

}