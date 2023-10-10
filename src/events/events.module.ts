import { Module } from '@nestjs/common';
import { EventsService } from './events.service';
import { EventsController } from './events.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { eventSchema } from './entities/event.entity';
import { userSchema } from 'src/users/entities/user.entity';
import { factureSchema } from 'src/factures/entities/facture.entity';

@Module({
  imports: [MongooseModule.forFeature([{ name: 'events', schema: eventSchema }]),
  MongooseModule.forFeature([{ name: 'users', schema: userSchema }])],
  controllers: [EventsController],
  providers: [EventsService]
})
export class EventsModule { }
