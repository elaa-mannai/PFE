import { Controller, Get, Post, Body, Patch, Param, Delete, HttpStatus, Res, Query, UploadedFiles, UploadedFile } from '@nestjs/common';
import { ProductsService } from './products.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { FilesInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { ApiBody, ApiConsumes, ApiTags } from '@nestjs/swagger';

@Controller('products')
@ApiTags('products')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) { }

  @Post()
  async create(@Body() createProductDto: CreateProductDto,  @Res() response) {
    try {
      const newproduct = await this.productsService.createProduct(createProductDto)
      return response.status(HttpStatus.CREATED).json({
        message: 'Product created successfully',
        status: HttpStatus.CREATED,
        data: newproduct
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
  async findAllProduct(@Res() response) {
    try {
      const Pdata = await this.productsService.findAllProducts()
      return response.status(HttpStatus.OK).json({
        message: "Product found successfully",
        status: HttpStatus.OK,
        data: Pdata
      })

    } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
        message: error.message,
        status: HttpStatus.BAD_REQUEST,
        data: null
      })
    }
  }

  @Get(':id')
  async findOne(@Param('id') productId: string, @Res() response) {
    try {
      const Pdata = await this.productsService.findOneProduct(productId)
      return response.status(HttpStatus.OK).json({
        message: "Product found successfully",
        status: HttpStatus.OK,
        data: Pdata
      })

    } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
        message: error.message,
        status: HttpStatus.BAD_REQUEST,
        data: null
      })
    }
  }


 
  @Patch(':id')
  async update(@Res() response, @Param('id') productId: string, @Body() updateProductDto: UpdateProductDto) {
    try {
      const Pdata = await this.productsService.updateProduct(productId, updateProductDto)

      return response.status(HttpStatus.OK).json({
        message: "Product Updated successfully",
        status: HttpStatus.OK,
        data: Pdata
      })
    } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
        message: error.message,
        status: HttpStatus.BAD_REQUEST,
        data: null
      })
    }
  }

  @Delete(':id')
  async remove(@Param('id') productId: string, @Res() response) {
    try {
      const pdata = await this.productsService.removeProduct(productId)
      return response.status(HttpStatus.OK).json({
        message: "Product Deleted successfully",

      })
    } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
        message: error.message,
        status: HttpStatus.BAD_REQUEST,
        data: null
      })
    }
  }



///////////
  @Get("user/:id")
  async getAllProductsbyuser(@Param('id') UserId: string ,@Res() response) {
    try{
      const ProductsData=await this.productsService.findAllProductsByuser(UserId);
      return response.status(HttpStatus.OK).json({
        message:'All Products data found successfully',
        status:HttpStatus.OK,
        data:ProductsData
      })
    }catch (err){
      return response.status(HttpStatus.BAD_REQUEST).json({
        message:err,
        status:HttpStatus.BAD_REQUEST,
        data:null
      })
    }
    
  }


 /*  @Get("favoriteproduct/:id/:favorite")
  async getAllFavoriteProduct( @Param(":id") UserId: string ,@Query(':favorite') favoriteProduct: boolean ,@Res() response) {
    try{
      const ProductsData=await this.productsService.findAllProductsByuserCustomer(UserId, favoriteProduct);
      return response.status(HttpStatus.OK).json({
        message:'All Products data found successfully',
        status:HttpStatus.OK,
        data:ProductsData
      })
    }catch (err){
      return response.status(HttpStatus.BAD_REQUEST).json({
        message:err,
        status:HttpStatus.BAD_REQUEST,
        data:null
      })
    }
  } */


  
}

