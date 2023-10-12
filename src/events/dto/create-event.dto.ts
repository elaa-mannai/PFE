import { IsString, IsNotEmpty, IsNumber, IsDate, IsArray } from "class-validator"
import { ApiProperty } from "@nestjs/swagger"

export class CreateEventDto {
    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    @IsNotEmpty()
    titleevent: string

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    @IsNotEmpty()
    description: string

    @ApiProperty({
        type: Date,
        description: 'this is a required property'
    })
    @IsDate()
    @IsNotEmpty()
    date_debut: Date

    @ApiProperty({
        type: Date,
        description: 'this is a required property'
    })
    @IsDate()
    @IsNotEmpty()
    date_fin: Date

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    @IsNotEmpty()
    local: string

    @ApiProperty({
        type: Number,
        description: 'this is a required property'
    })
    @IsNumber()
    @IsNotEmpty()
    budget: number


    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    @IsNotEmpty()
    user: string
    
/* 
    @ApiProperty({
        type: Array,
        description: 'this is a required property'
    })
    @IsArray()
    //@IsNotEmpty()
    guests: string[]
 */
    /* @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    @IsNotEmpty()
    products: string */
    

}
