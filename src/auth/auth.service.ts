import { BadRequestException, Injectable } from '@nestjs/common';
import { UsersService } from 'src/users/users.service';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { CreateLoginDto } from './dto/createlogin.dto';
import * as argon2 from 'argon2'
import { UpdateUserDto } from 'src/users/dto/update-user.dto';
import { MailerService } from '@nestjs-modules/mailer/dist';

@Injectable()
export class AuthService {
    constructor(
        private usersService: UsersService,
        private jwtService: JwtService,
        private configService: ConfigService,
        private mailerService: MailerService,
    ) { }

    async getToken(userId: string, username: string) {
        const [accessToken, refreshToken] = await Promise.all([
            this.jwtService.signAsync({
                sub: userId, username
            },
                {
                    secret: this.configService.get<string>('JWT_ACCESS_SECRET'),
                    expiresIn: '10d'
                }),
            this.jwtService.signAsync({
                sub: userId, username
            }, {
                secret: this.configService.get<string>('JWT_REFRESH_SECRET'),
                expiresIn: '15d'
            })
        ])
        return { accessToken, refreshToken }
    }

    async signIn(data: CreateLoginDto) {
        const user = await this.usersService.findOneByUsername(data.username)
        if (!user) throw new BadRequestException('User does not exist!')
        const passwordMatch = await argon2.verify(user.password, data.password)
        if (!passwordMatch) throw new BadRequestException('Password is incorrect')
        const tokens = await this.getToken(user._id, user.username)
        await this.updateRefreshToken(user._id, tokens.refreshToken)
        return { tokens, user }
    }


    async logout(userId: string) {
        this.usersService.updateUser(userId, { refreshToken: null })
    }


    async updateRefreshToken(userId: string, refreshToken: string) {
        const hashedRefreshToken = await argon2.hash(refreshToken)
        await this.usersService.updateUser(userId, { refreshToken: hashedRefreshToken })
    }


    async updateProfile(userId, updateUserDto: UpdateUserDto) {
        const user = await this.usersService.updateUser(userId, updateUserDto)
        const tokens = await this.getToken(user._id, user.username)
        await this.updateRefreshToken(user._id, tokens.refreshToken)
        return { tokens, user }
    }


    async resetpassword(user: any, token: string) {
        const newpassword = token
        console.log("newpassword", newpassword)
        await this.mailerService.sendMail({
            to: user.email,
            template: './resetpassword',
            context: {
                name: user.name,
                email: user.email,
                newpassword,
                subject: 'Reset your password',
            },
        }).then(()=>{
            console.log('password ------------------------')
          }).catch((error)=>{
            console.log(`error=================>${error.message}`)
          })
        const passHashed = await argon2.hash(newpassword);
        console.log("passHased", passHashed)
        await this.usersService.findOneAndUpdateByEmail({ email: user.email }, { password: passHashed })
    }


    async updatePassword(userId: string, updateUserDto: UpdateUserDto): Promise<any> {
        const userExists = await this.usersService.findOneUser(userId)
        if (!userExists) {
            throw new BadRequestException("User does not exist")
        }
        const tokens = await this.getToken(userExists._id, userExists.username)
        await this.updateRefreshToken(userExists._id, tokens.refreshToken)
        const hash = await argon2.hash(updateUserDto.password)
        // operateur rest to get the same data but the update will be only affected on password ...
        const user = await this.usersService.updateUser(userId, { ...updateUserDto, password: hash })
        return { user, tokens }
    }


}

