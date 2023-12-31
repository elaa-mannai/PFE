import { Module } from '@nestjs/common';
import { GuestsService } from './guests.service';
import { GuestsController } from './guests.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { guestschema } from './entities/guest.entity';
import { userSchema } from 'src/users/entities/user.entity';
import { eventSchema } from 'src/events/entities/event.entity';

@Module({
  imports: [MongooseModule.forFeature([{ name: 'guests', schema: guestschema }]),
  MongooseModule.forFeature([{ name: 'events', schema: eventSchema }]),
],
  controllers: [GuestsController],
  providers: [GuestsService]
})
export class GuestsModule { }
