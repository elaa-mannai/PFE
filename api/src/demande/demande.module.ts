import { Module } from '@nestjs/common';
import { DemandeController } from './demande.controller';
import { DemandeService } from './demande.service';
import { MongooseModule } from '@nestjs/mongoose';
import { userSchema } from 'src/users/entities/user.entity';
import { productSchema } from 'src/products/entities/product.entity';
import { demandeSchema } from './entities/demande.entity';
import { eventSchema } from 'src/events/entities/event.entity';

@Module({
  imports:[
    MongooseModule.forFeature([{name: 'demande', schema:demandeSchema}]),
    MongooseModule.forFeature([{ name: 'users', schema: userSchema }]),
    MongooseModule.forFeature([{ name: 'events', schema: eventSchema }]),
    MongooseModule.forFeature([{name:'products', schema:productSchema}])],

  controllers: [DemandeController],
  providers:[DemandeService,]

})
export class DemandeModule {}
