import { ApiProperty } from "@nestjs/swagger";
import { IsBoolean, IsNotEmpty, IsString } from "class-validator";

export class CreateGuestDto {
        @ApiProperty({
            type: String,
            description: 'this is a required property'
        })
        @IsString()
        @IsNotEmpty()
        name: string

        @ApiProperty({
            type: Boolean,
            description: 'this is a required property'
        })
        @IsBoolean()
        @IsNotEmpty()
        invited: boolean


}
