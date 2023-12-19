import { ApiProperty } from "@nestjs/swagger";
import {  IsArray, IsMongoId, IsNotEmpty, IsString } from "class-validator";

export class CreateChatDto {
    @ApiProperty({
        type:Array,
        description:'this is a required property'
    })
    @IsArray()
    messages:string[]


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
// @IsNotEmpty({ message: 'Receiver ID is required' })
// @IsMongoId({ message: 'Invalid receiver ID' })
@IsString()
reciever:string


@ApiProperty({
    type:String,
    description:'this is a required property'
})
// @IsNotEmpty({ message: 'Sender ID is required' })
// @IsMongoId({ message: 'Invalid sender ID' })
@IsString()
sender:string
}
