import { PartialType } from '@nestjs/mapped-types';
import { CreateDemandeDto } from './create-demande.dto';

export class UpdateDemandeDto extends PartialType(CreateDemandeDto) {}
