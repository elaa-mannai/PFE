import { Body, Controller, Get, Param, Patch, Post, Req, UseGuards } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateLoginDto } from './dto/createlogin.dto';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger/dist';
import { UpdateUserDto } from 'src/users/dto/update-user.dto';
import { CreateEmailDto } from './dto/createemail.dto';
import { Request } from 'express';
import { AccessTokenGuard } from 'src/common/guards/accessTokenGuard';
@Controller('auth')
@ApiTags('auth')
export class AuthController {
    constructor(private readonly authService: AuthService) { }

    @Post('signin')
    async signIn(@Body() data: CreateLoginDto) {
        return this.authService.signIn(data);
    }

    @ApiBearerAuth('access-token')
    @UseGuards(AccessTokenGuard)
    @Get('logout')
    logout(@Req() req: Request) {
        this.authService.logout(req.user['sub'])
    }

    @Patch('profile/:id')
    async updateUser(@Param('id') userId: string, @Body() updateUserDto: UpdateUserDto) {
        return this.authService.updateProfile(userId, updateUserDto)
    }

    @Post("resetpassword")
    async reset(@Body() req: CreateEmailDto) {
        const token = (Math.floor(10000000058585 + Math.random() * 9005632565)).
            toString();
        const user = { email: req.email }
        await this.authService.resetpassword(user, token);
    }

    @Patch('/updatepassword/:id')
    async updatepassword(@Param('id') userId: string, @Body() updateUserDto: UpdateUserDto) {
        return this.authService.updatePassword(userId, updateUserDto)
    }


}
