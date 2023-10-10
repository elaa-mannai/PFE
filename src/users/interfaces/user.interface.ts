import { Document } from "mongoose";

export interface IUser extends Document{
    
    readonly username:string
    readonly email:string
    readonly password:string
    readonly city:string
    readonly phone:string
    readonly adress:string
    readonly image:string
    readonly refreshToken:string

}