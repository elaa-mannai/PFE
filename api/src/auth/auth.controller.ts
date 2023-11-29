import { Body, Controller, Get, Param, Patch, Post, Req,Res, UseGuards } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateLoginDto } from './dto/createlogin.dto';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger/dist';
import { UpdateUserDto } from 'src/users/dto/update-user.dto';
import { CreateEmailDto } from './dto/createemail.dto';
import { Request } from 'express';
import { AccessTokenGuard } from 'src/common/guards/accessTokenGuard';
import { AuthGuard } from '@nestjs/passport';
import { UsersService } from 'src/users/users.service';
@Controller('auth')
@ApiTags('auth')
export class AuthController {
    constructor(private readonly authService: AuthService,
        private readonly userService: UsersService) { }

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


 /*    @Get('auth/google/callback')
    @UseGuards(AuthGuard('google'))
   async googleAuthRedirect(@Req() req, @Res() res) {
      // Handle the Google Sign-In callback
      const user = req.user;

      const existingUser = await this.userService.findByGoogleId(user.id);

if (existingUser) {
      // User already exists, update user details if needed
      await this.userService.updateUser(existingUser.id ,{displayName: user.displayName, refreshToken: user.refreshToken});
    } else {
      // User doesn't exist, create a new user in the database
      await this.userService.createUser({
        items:  user.items,
        username:  user.username,
        email:  user.email,
        password:  user.password,
        googleId:  user.googleId, 
        displayName:  user.displayName, refreshToken:  user.refreshToken,
        city: user.city,
        adress: user.adress,
        image: user.image,
        phone:user.phone},);
      
      
      res.redirect('/LoginView'); // Redirect to the desired page after authentication
    }

} */}
