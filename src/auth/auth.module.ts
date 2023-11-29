import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { JwtModule } from '@nestjs/jwt';
import { UsersModule } from 'src/users/users.module';
import { AccessTokenStrategy } from './strategies/strategy.accesstoken';
import { ProductsModule } from 'src/products/products.module';
import { MongooseModule } from '@nestjs/mongoose';
import { productSchema } from 'src/products/entities/product.entity';
import { PassportModule } from '@nestjs/passport';
import { GoogleStrategy } from './strategies/google.strategy';

@Module({
  imports: [JwtModule.register({}),
    PassportModule.register({ defaultStrategy: 'google' }), 
    PassportModule.register({ session: true }),
    UsersModule, 
    MongooseModule.forFeature([{name:'products', schema:productSchema}])],
  controllers: [AuthController],
  providers: [AuthService, AccessTokenStrategy, GoogleStrategy]
})
export class AuthModule { }
