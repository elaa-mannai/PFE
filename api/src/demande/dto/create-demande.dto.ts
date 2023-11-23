import { IsString, IsNotEmpty, IsNumber, IsDate, IsArray, IsBoolean } from "class-validator"
import { ApiProperty } from "@nestjs/swagger"

export class CreateDemandeDto {
    @ApiProperty({
        type: Array,
        description: 'this is a required property'
    })
    @IsArray()
    //@IsNotEmpty()
    user: string[]

    @ApiProperty({
        type: Array,
        description: 'this is a required property'
    })
    @IsArray()
    //@IsNotEmpty()
    products: string[]

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsArray()
    //@IsNotEmpty()
    events: string[]



    @ApiProperty({
        type:Boolean,
        description:'this is a required property'
    })
    @IsBoolean()
    state:boolean

    }
