import { IsString, IsNotEmpty, IsNumber } from "class-validator"
import { ApiProperty } from "@nestjs/swagger"

export class CreateCategoryDto {
    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    @IsNotEmpty()
    name: string



}
