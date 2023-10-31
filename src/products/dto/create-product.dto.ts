import { IsString, IsNotEmpty, IsNumber, IsDate, IsArray, IsBoolean } from "class-validator"
import { ApiProperty } from "@nestjs/swagger"

export class CreateProductDto {
    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    //@IsNotEmpty()
    nameproduct: string

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    //  @IsNotEmpty()
    description: string

    @ApiProperty({
        type: Number,
        description: 'this is a required property'
    })
    @IsNumber()
    //  @IsNotEmpty()
    price: number


    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsNumber()
    //  @IsNotEmpty()
    location:string

    @ApiProperty({
        type: Array,
        description: 'this is a required property'
    })
    @IsArray()
    //@IsNotEmpty()
    images: string[]


    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    @IsNotEmpty()
    category: string

    
    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    @IsNotEmpty()
    user: string
    


}
