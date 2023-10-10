import { Controller, Get, Post, Body, Patch, Param, Delete, HttpStatus, Res, UseInterceptors, UploadedFiles, UploadedFile } from '@nestjs/common';
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
   @ApiBody({
    schema: {
      type: 'object',
      properties: {
        nameproduct: {
          type: 'string'
        },
        description: {
          type: 'string'
        },
        price: {
          type: 'number'
        },
        category:{
          type:'string'
        },
        files: {
          type: 'array',
          items: {
            type: 'string',
            format: 'binary'
          }
        },
        user:{
          type:'string'
        }
      }
    }
  }) 
  @ApiConsumes('multipart/form-data')
  @UseInterceptors(
    FilesInterceptor("files", 20, {
      storage: diskStorage({
        destination: "./upload/products",
        filename: (_request, file, callback) =>
          callback(null, `${new Date().getTime()}-${file.originalname}`)
      })
    })
  )
  async create(@Body() createProductDto: CreateProductDto, @UploadedFiles() files, @Res() response) {
    try {
      createProductDto.images = files.map(item => item.filename)
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


  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        nameproduct: {
          type: 'string'
        },
        description: {
          type: 'string'
        },
        price: {
          type: 'number'
        },
        category:{
          type:'string'
        },
        files: {
          type: 'array',
          items: {
            type: 'string',
            format: 'binary'
          }
        }
      }
    }
  }) 

  
  @ApiConsumes('multipart/form-data')
  @UseInterceptors(
    FilesInterceptor("files", 20, {
      storage: diskStorage({
        destination: "./upload/products",
        filename: (_request, file, callback) =>
          callback(null, file.fieldname + '-' + Date.now())}),
    })
  )
  @Patch(':id')
  async update(@Res() response, @Param('id') productId: string, @Body() updateProductDto: UpdateProductDto, @UploadedFiles() files) {
    try {
      updateProductDto.images = files.map(item => item.filename)
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
}
