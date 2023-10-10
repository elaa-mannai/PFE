import { Module } from '@nestjs/common';
import { GuestsService } from './guests.service';
import { GuestsController } from './guests.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { guestschema } from './entities/guest.entity';

@Module({
  imports: [MongooseModule.forFeature([{ name: 'guests', schema: guestschema }])],
  controllers: [GuestsController],
  providers: [GuestsService]
})
export class GuestsModule { }
