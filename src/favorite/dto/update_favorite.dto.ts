import { PartialType } from '@nestjs/mapped-types';
import { CreateFavoriteDto } from './create_favorite.dto';

export class UpdateFavoriteDto extends PartialType(CreateFavoriteDto) {
    
}
