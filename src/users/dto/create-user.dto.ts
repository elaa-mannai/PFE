import { IsString , IsNotEmpty , IsNumber, IsEnum, IsArray } from "class-validator"
import { ApiProperty } from "@nestjs/swagger"

export class CreateUserDto {

    
    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })    
    @IsString()
  //  @IsNotEmpty()
    items: string
    
   
    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
   // @IsNotEmpty()
    username: string
    
    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
   // @IsNotEmpty()
    email: string

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
   // @IsNotEmpty()
    password: string

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
  //  @IsNotEmpty()
    city: string

    @ApiProperty({
        type: Number,
        description: 'this is a required property'
    })
    @IsNumber()
  //  @IsNotEmpty()
    phone: number

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
  //  @IsNotEmpty()
    adress: string

    @ApiProperty({
        type:String,
        description: 'this is a required property'
    })
    @IsString()
    //@IsNotEmpty()
    image: string


  

}
