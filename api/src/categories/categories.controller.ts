import { Controller, Get, Post, Body, Patch, Param, Delete, Res, HttpStatus, Query } from '@nestjs/common';
import { CategoriesService } from './categories.service';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { ApiTags } from '@nestjs/swagger/dist/decorators';
@Controller('categories')
@ApiTags('categories')
export class CategoriesController {
  constructor(private readonly categoriesService: CategoriesService) { }

  @Post()
  async create(@Res() response, @Body() createCategoryDto: CreateCategoryDto) {
    try {
      const newCategory = await this.categoriesService.createCategory(createCategoryDto)
      return response.status(HttpStatus.CREATED).json({
        message: 'Categorie created successfully',
        status: HttpStatus.CREATED,
        data: newCategory
      })
    } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
        message: error.message,
        status: HttpStatus.BAD_REQUEST,
        data: null
      })
    }
  }

  
@Get("/getbyname")
async getCategoriebyname(@Res() response, @Query('name') name: string) {
  try {
    const existingCategorie = await
      this.categoriesService.getCategorieByName(name)
    return response.status(HttpStatus.OK).json({
      message: 'categorie found successfully', existingCategorie,
    });
  } catch (err) {
    return response.status(err.status).json(err.response);
  }
}


  @Get()
  async findAllCategorie(@Res() response) {
    try{
      const categorieData= await this.categoriesService.findAllCategories()
      return response.status(HttpStatus.OK).json({
        message:"Categorie found successfully",
        status:HttpStatus.OK,
        data:categorieData
      })
  } catch(error){
    return response.status(HttpStatus.BAD_REQUEST).json({
      message:error.message,
      status:HttpStatus.BAD_REQUEST,
      data:null
    })
  }
}

  @Get(':id')
  async findOneCategory(@Res() response,@Param('id') categoriyId: string) {
    try {
      const exsitingCategorie =await this.categoriesService.findOneCategory(categoriyId)
      return response.status(HttpStatus.OK).json({
        message:"Categorie found successfully",
        status:HttpStatus.OK,
        data:exsitingCategorie
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
  async update(@Res() response,@Param('id') categoryId: string, @Body() updateCategoryDto: UpdateCategoryDto) {

    try {
      const updatedCategorie=await this.categoriesService.updateCategorie(categoryId,updateCategoryDto );
      return response.status(HttpStatus.OK).json({
        message:"Categorie Updated successfully",
        status:HttpStatus.OK,
        data:updatedCategorie
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
 async remove(@Res() response,@Param('id') categoryId: string) {
    try {
      
      const deleteCategorie=await  this.categoriesService.deleteCategorieById(categoryId);

      return response.status(HttpStatus.OK).json({
        message:"Categorie Deleted successfully",
      
      })
    } catch (error) {
       return response.status(HttpStatus.BAD_REQUEST).json({
        message:error.message,
        status:HttpStatus.BAD_REQUEST,
        data:null
      })
    }
  }




////////////////////



}
