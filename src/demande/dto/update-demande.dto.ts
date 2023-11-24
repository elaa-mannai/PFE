import { PartialType } from '@nestjs/swagger';
import { CreateDemandeDto } from './create-demande.dto';

export class UpdateDemandeDto extends PartialType(CreateDemandeDto) {}
