import { Module } from '@nestjs/common';
import { FavoriteService } from './favorite.service';
import { FavoriteController } from './favorite.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { userSchema } from 'src/users/entities/user.entity';
import { productSchema } from 'src/products/entities/product.entity';
import { favoriteSchema } from './entities/favorite.entities';

@Module({
  imports:[ MongooseModule.forFeature([{ name: 'favorites', schema: favoriteSchema}]),
  MongooseModule.forFeature([{ name: 'users', schema: userSchema }]),
  MongooseModule.forFeature([{name:'products', schema:productSchema}])],
  providers: [FavoriteService],
  controllers: [FavoriteController]
})
export class FavoriteModule {}
