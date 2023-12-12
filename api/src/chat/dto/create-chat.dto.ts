import { ApiProperty } from "@nestjs/swagger";
import {  IsArray, IsString } from "class-validator";

export class CreateChatDto {
    @ApiProperty({
        type:Array,
        description:'this is a required property'
    })
@IsArray()
message:string[]


/* @ApiProperty({
    type:String,
    description:'this is a required property'
})
@IsString()
users:string */


@ApiProperty({
    type:String,
    description:'this is a required property'
})
@IsString()
reciever:string

@ApiProperty({
    type:String,
    description:'this is a required property'
})
@IsString()
sender:string
}
