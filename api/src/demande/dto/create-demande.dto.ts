import { ApiProperty } from "@nestjs/swagger";
import { IsBoolean, IsNotEmpty, IsString } from "class-validator";

export class CreateDemandeDto {
    @ApiProperty({
        type:Boolean,
        description:'this is a required property'
    })
@IsBoolean()
state:boolean

@ApiProperty({
    type: String,
    description: 'this is a required property'
})
@IsString()
// @IsNotEmpty()
users: string

@ApiProperty({
    type: String,
    description: 'this is a required property'
})
@IsString()
// @IsNotEmpty()
products: string

@ApiProperty({
    type: String,
    description: 'this is a required property'
})
@IsString()
// @IsNotEmpty()
events: string
}
