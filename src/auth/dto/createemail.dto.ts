import { ApiProperty } from "@nestjs/swagger"
import { IsString, IsNotEmpty } from "class-validator"

export class CreateEmailDto {

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })

    @IsString()
    @IsNotEmpty()
    email: string


}