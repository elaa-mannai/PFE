import { IsString, IsNotEmpty, IsNumber, IsDate, IsArray, IsBoolean } from "class-validator"
import { ApiProperty } from "@nestjs/swagger"

export class CreateFavoriteDto {

    
    @ApiProperty({
        type:Boolean,
        description:'this is a required property'
    })
    @IsBoolean()
    state:boolean

    @ApiProperty({
        type:String,
        description:'this is a required property'
    })
    @IsString()
    products:string

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
   // @IsNotEmpty()
    user: string

}