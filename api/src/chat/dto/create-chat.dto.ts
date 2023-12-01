import { ApiProperty } from "@nestjs/swagger";
import {  IsString } from "class-validator";

export class CreateChatDto {
    @ApiProperty({
        type:String,
        description:'this is a required property'
    })
@IsString()
message:string


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
