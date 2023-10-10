import { Controller, Get, Post, Body, Patch, Param, Delete, Res, HttpStatus, UseInterceptors, UploadedFiles, UploadedFile } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { ApiBody, ApiConsumes, ApiTags } from '@nestjs/swagger/dist/decorators';
import { FileInterceptor, FilesInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { CreateProductDto } from 'src/products/dto/create-product.dto';

@Controller('users')
@ApiTags('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post()
  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        items: {
          type: 'string'
        },
        username: {
          type: 'string'
        },
        email: {
          type: 'string'
        },
        password: {
          type: 'string'
        },
        city: {
          type: 'string'
        },
        adress: {
          type: 'string'
        },
        phone: {
          type: 'number'
        },
        file: {
          type: 'string',
          format:'binary'
        }
      }
    }
  }) 
  @ApiConsumes('multipart/form-data')
  @UseInterceptors(
    FileInterceptor("file", {
      storage: diskStorage({
        destination: "./upload/users",
        filename: (_request, file, callback) =>
          callback(null, `${new Date().getTime()}-${file.originalname}`)
      })
    })
  )
  async createUser(@Body() createuserDto: CreateUserDto, @UploadedFile() file: Express.Multer.File,  @Res() response){
    try{
   // createuserDto.image = file.filename
     const newUser=await this.usersService.createUser(createuserDto)
      return response.status(HttpStatus.CREATED).json({
        message:'user created successfully',
        status:HttpStatus.CREATED,
        data:newUser
      })
    }catch(error){
      return response.status(HttpStatus.BAD_REQUEST).json({
        message:error.message,
        status:HttpStatus.BAD_REQUEST,
        data:null
      })
    }
  }

  

  @Get()
  async findAllUsers(@Res() response) {
    try {
      const userData= await this.usersService.findAllUsers()
      return response.status(HttpStatus.OK).json({
        message:"users found successfully",
        status:HttpStatus.OK,
        data:userData
      })
    } catch (error) {
      return response.status(HttpStatus.BAD_REQUEST).json({
        message:error.message,
        status:HttpStatus.BAD_REQUEST,
        data:null
      })
    }    
  }

  @Get(':id')
  async findOne(@Res() response ,@Param('id') userId: string) {
    try {
      const exsitingUser =await this.usersService.findOneUser(userId)
      return response.status(HttpStatus.OK).json({
        message:"User found successfully",
        status:HttpStatus.OK,
        data:exsitingUser
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
  @ApiBody({
    schema: {
      type: 'object',
      properties: {
        items: {
          type: 'string'
        },
       
        username: {
          type: 'string'
        },
        email: {
          type: 'string'
        },
        password: {
          type: 'string'
        },
        city: {
          type: 'string'
        },
        adress: {
          type: 'string'
        },
        phone: {
          type: 'number'
        },
        file: {
          type: 'string',
          format:'binary'
        }
      }
    }
  }) 
  @ApiConsumes('multipart/form-data')
  @UseInterceptors(
    FileInterceptor("file", {
      storage: diskStorage({
        destination: "./upload/users",
        filename: (_request, file, callback) =>
          callback(null, Date.now() + file.originalname)
      })
    })
  )
  async update(@Res() response,@Param('id') userId: string, @UploadedFile() file: Express.Multer.File, @Body() updateUserDto: UpdateUserDto) {

    try {
     updateUserDto.image = file.filename
      const updateduser=await this.usersService.updateUser(userId, updateUserDto);
      return response.status(HttpStatus.OK).json({
        message:"user Updated successfully",
        status:HttpStatus.OK,
        data:updateduser
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
 async remove(@Res() response,@Param('id') userId: string) {
    try {
      
      const deleteUser=await  this.usersService.deleteUserById(userId);

      return response.status(HttpStatus.OK).json({
        message:"user Deleted successfully",
      
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
