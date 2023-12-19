import { Document, ObjectId, Types } from "mongoose";

export interface IChat extends Document{
     messages: string[];
    readonly sender: Types.ObjectId;
    readonly receiver: Types.ObjectId;
}


