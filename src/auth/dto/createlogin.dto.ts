import { ApiProperty } from "@nestjs/swagger"
import { IsString, IsNotEmpty } from "class-validator"

export class CreateLoginDto {

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })

    @IsString()
    @IsNotEmpty()
    username: string

    
    @ApiProperty({
        type:String,
        description:'this is a required property'
    })

    @IsString()
    @IsNotEmpty()
    password: string


}