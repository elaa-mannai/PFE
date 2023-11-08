import { Model } from 'mongoose';
import { IUser } from 'src/users/interfaces/user.interface';
import { IFavorite } from './interface/favorite.interface';
import { CreateFavoriteDto } from './dto/create_favorite.dto';
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { UpdateFavoriteDto } from './dto/update_favorite.dto';
import { IProduct } from 'src/products/interface/product.interface';

@Injectable()
export class FavoriteService {

    constructor(
        @InjectModel('favorites')
    private favoriteModel :Model<IFavorite>,
    @InjectModel('users')
    private userModel:Model<IUser>,
    @InjectModel('products')
    private productModel:Model<IProduct>
    ){}
    
  

    async getFavoriteByUserIdAndFavoriteState(userId: string, state : boolean):Promise<IFavorite[]>{
      const favoriteDatebyUserId= await this.favoriteModel.find({user :userId, state})
      if (!favoriteDatebyUserId || favoriteDatebyUserId.length ==0 ){
     return null
      }
        return favoriteDatebyUserId;
  }





    async createFavorite(createFavoriteDto: CreateFavoriteDto ): Promise<IFavorite> {
        const newFavorite = new this.favoriteModel(createFavoriteDto)
         await this.userModel.updateOne({ _id: createFavoriteDto.user },
          { $push: {  favorites: newFavorite._id } });

          await this.productModel.updateOne({ _id: createFavoriteDto.products },
            {  $set: { favorites: newFavorite._id} });
      
        return await newFavorite.save()
      }


      async findAllFavorite(): Promise<IFavorite[]>{
        const favoriteData = await this.favoriteModel.find().exec()
        if(!favoriteData || favoriteData.length === 0){
            return null
        }
        return favoriteData
      }

      async findOneFavorite(favoriteId: string): Promise<IFavorite>{
        const exsitingFavorite = await this.favoriteModel.findById(favoriteId).exec()
        if(!exsitingFavorite){
            throw new NotFoundException("favorite list not found")
        }
        return exsitingFavorite
      }

      async updateFavorite(favoriteId: string, updateFavoriteDto: UpdateFavoriteDto):Promise<IFavorite>{
        const updateFavorite = await this.favoriteModel.findByIdAndUpdate(favoriteId, updateFavoriteDto, { new: true });
    if (!updateFavorite) {
      throw new NotFoundException("favorite not found ")
    }
    return updateFavorite 
      }

      async deleteFavoriteById(FavoriteId: string): Promise<IFavorite> {
        const deleteFavorite = await this.favoriteModel.findByIdAndDelete(FavoriteId);
        await this.userModel.updateOne({_id: deleteFavorite.user}, {$pull:{favorites:deleteFavorite._id}})
        if (!deleteFavorite) {
          throw new NotFoundException('Favorite not found')
        }
        return deleteFavorite
      }

    async getFavoriteByState(status: boolean):Promise<IFavorite[]>{
        const favoriteDatabystate =await this.favoriteModel.find({state : status})
        if (!favoriteDatabystate || favoriteDatabystate.length ==0 ){
            return null
            }
       return favoriteDatabystate;
    }

    async getFavoriteByUserId(userId: string):Promise<IFavorite[]>{
        const favoriteDatebyUserId= await this.favoriteModel.find({user :userId})
        if (!favoriteDatebyUserId || favoriteDatebyUserId.length ==0 ){
       return null
        }
          return favoriteDatebyUserId;
    }


            
}
