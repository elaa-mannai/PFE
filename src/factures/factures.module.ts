import { Module } from '@nestjs/common';
import { FacturesService } from './factures.service';
import { FacturesController } from './factures.controller';
import { factureSchema } from './entities/facture.entity';
import { MongooseModule } from '@nestjs/mongoose';
import { eventNames } from 'process';
import { eventSchema } from 'src/events/entities/event.entity';

@Module({
  imports: [MongooseModule.forFeature([{ name: 'factures', schema: factureSchema }])
  ],
  controllers: [FacturesController],
  providers: [FacturesService]
})
export class FacturesModule { }
