import { Module } from '@nestjs/common';
import { ProductsService } from './products.service';
import { ProductsController } from './products.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { productSchema } from './entities/product.entity';
import { CategorieSchema } from 'src/categories/entities/category.entity';
import { userSchema } from 'src/users/entities/user.entity';

@Module({
  imports:[MongooseModule.forFeature([{name:'products', schema:productSchema}]), 
  MongooseModule.forFeature([{name:'categories', schema:CategorieSchema}]),  
  MongooseModule.forFeature([{ name: 'users', schema: userSchema }])],
  controllers: [ProductsController],
  providers: [ProductsService],
  
})
export class ProductsModule {}
