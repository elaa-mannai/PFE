import { Module } from '@nestjs/common';
import { DemandeService } from './demande.service';
import { DemandeController } from './demande.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { eventSchema } from 'src/events/entities/event.entity';
import { productSchema } from 'src/products/entities/product.entity';
import { userSchema } from 'src/users/entities/user.entity';
import { demandeSchema } from './entities/demande.entity';

@Module({
  imports:[MongooseModule.forFeature([{name:'demande', schema:demandeSchema}]),
    MongooseModule.forFeature([{name:'products', schema:productSchema}]), 
  MongooseModule.forFeature([{name:'events', schema:eventSchema}]),  
  MongooseModule.forFeature([{ name: 'users', schema: userSchema }]),],
  
  controllers: [DemandeController],
  providers: [DemandeService],
})
export class DemandeModule {}
