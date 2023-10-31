import { Controller, Get, Post, Body, Patch, Param, Delete, Res, HttpStatus, Query } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { FavoriteService } from './favorite.service';
import { response } from 'express';
import { CreateFavoriteDto } from './dto/create_favorite.dto';
import { UpdateFavoriteDto } from './dto/update_favorite.dto';

@Controller('favorites')
@ApiTags('favorites')
export class FavoriteController {
    constructor (
        private readonly favoriteService: FavoriteService
        ){}

@Post()
async create(@Res()response, @Body() createFavoriteDto:CreateFavoriteDto){
    try {
        const newFavorite = await this.favoriteService.createFavorite(createFavoriteDto)
        return response.status(HttpStatus.CREATED).json({
          message: 'Favorite created successfully',
          status: HttpStatus.CREATED,
          data: newFavorite
        })
      } catch (error) {
        return response.status(HttpStatus.BAD_REQUEST).json({
          message: error.message,
          status: HttpStatus.BAD_REQUEST,
          data: null
        })
      }
}


@Get()
async findAllFavorite(@Res() response) {
  try{
    const favoriteData= await this.favoriteService.findAllFavorite()
    return response.status(HttpStatus.OK).json({
      message:"Favorite found successfully",
      status:HttpStatus.OK,
      data:favoriteData
    })
} catch(error){
  return response.status(HttpStatus.BAD_REQUEST).json({
    message:error.message,
    status:HttpStatus.BAD_REQUEST,
    data:null
  })
}
}


@Get("user/:id")
async getAllFavoritebyUser(@Param('id') userId: string ,@Res() response) {
  try{
    const favoriteDatebyUserId=await this.favoriteService.getFavoriteByUserId(userId);
    return response.status(HttpStatus.OK).json({
      message:'All Favorite by User data found successfully',
      status:HttpStatus.OK,
      data:favoriteDatebyUserId
    })
  }catch (err){
    return response.status(HttpStatus.BAD_REQUEST).json({
      message:err,
      status:HttpStatus.BAD_REQUEST,
      data:null
    })
  }
}



@Get('state')
async getAllFavoriteByState(@Query('state') status : boolean, @Res()response){
   try{
const favoritestatus = await this.favoriteService.getFavoriteByState(status)
return response.status(HttpStatus.OK).json({
   message:'All favorite by state data found successfully',
   status:HttpStatus.OK,
   data:favoritestatus
 })
   }
   catch (err){
       return response.status(HttpStatus.BAD_REQUEST).json({
         message:err,
         status:HttpStatus.BAD_REQUEST,
         data:null
       })
}
}


@Get(':id')
async findOneFavorite(@Res() response,@Param('id') favoriteId: string) {
  try {
    const exsitingFavorite =await this.favoriteService.findOneFavorite(favoriteId)
    return response.status(HttpStatus.OK).json({
      message:"Favorite found successfully",
      status:HttpStatus.OK,
      data:exsitingFavorite
    })
  } catch (error) {
    return response.status(HttpStatus.BAD_REQUEST).json({
      message:error.message,
      status:HttpStatus.BAD_REQUEST,
      data:null
    })
  } 
}

@Patch(':id')
async update(@Res() response,@Param('id') favoriteId: string, @Body() updateFavoriteDto: UpdateFavoriteDto) {

  try {
    const updatedFavorite=await this.favoriteService.updateFavorite(favoriteId, updateFavoriteDto);
    return response.status(HttpStatus.OK).json({
      message:"Favorite Updated successfully",
      status:HttpStatus.OK,
      data:updatedFavorite
    })
  } catch (error) {
     return response.status(HttpStatus.BAD_REQUEST).json({
      message:error.message,
      status:HttpStatus.BAD_REQUEST,
      data:null
    })
  }
}


@Delete(':id')
async remove(@Res() response,@Param('id') FavoriteId: string) {
   try {
     
     const deleteFavorite=await  this.favoriteService.deleteFavoriteById(FavoriteId);

     return response.status(HttpStatus.OK).json({
       message:"Favorite Deleted successfully",
     
     })
   } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
       message:error.message,
       status:HttpStatus.BAD_REQUEST,
       data:null
     })
   }
 }




}
