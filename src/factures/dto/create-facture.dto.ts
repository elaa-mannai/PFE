import { IsString , IsNotEmpty , IsNumber, IsDate } from "class-validator"
import { ApiProperty } from "@nestjs/swagger"

export class CreateFactureDto {
    @ApiProperty({
        type: Date,
        description: 'this is a required property'
    })
    @IsDate()
    @IsNotEmpty()
    date_facture:Date

    @ApiProperty({
        type: Number,
        description: 'this is a required property'
    })
    @IsNumber()
    @IsNotEmpty()
    total:number

    @ApiProperty({
        type: String,
        description: 'this is a required property'
    })
    @IsString()
    @IsNotEmpty()
    event: string
}
