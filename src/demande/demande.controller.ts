import { Controller, Get, Post, Body, Patch, Param, Delete, HttpStatus, Res, Query } from '@nestjs/common';
import { DemandeService } from './demande.service';
import { CreateDemandeDto } from './dto/create-demande.dto';
import { UpdateDemandeDto } from './dto/update-demande.dto';
import { ApiTags } from '@nestjs/swagger';
import { response } from 'express';
import { IDemande } from './interface/demande.interface';

@Controller('demande')
@ApiTags('demande')
export class DemandeController {
  constructor(private readonly demandeService: DemandeService) {}

  @Post()
 async create(@Body() createDemandeDto: CreateDemandeDto,@Res() response) {
  try {
    const newproduct = await this.demandeService.create(createDemandeDto)
    return response.status(HttpStatus.CREATED).json({
      message: 'Demande created successfully',
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

 @Get('stateAndUserId/:id/state')
 async GetDemandeByUserIdAndStateUrl(@Query('state') state : boolean,@Param('id') UserId: string ,@Res() response): Promise<IDemande>{
 try{
  const favoriteDate = await this.demandeService.getDemandeByUserIdAndStateUrl(UserId, state)
  return response.status(HttpStatus.OK).json({
    message:"DemandeByUserIdAndStateUrl found successfully",
    status:HttpStatus.OK,
    data:favoriteDate
  })
 }catch
  (error){
    return response.status(HttpStatus.BAD_REQUEST).json({
      message:error.message,
      status:HttpStatus.BAD_REQUEST,
      data:null
    })
 } 
 }

 @Get('stateAndVendorId/:id/state')
 async GetDemandeByVendorAndState(@Query('state') state : boolean,@Param('id') VendorId: string ,@Res() response): Promise<IDemande>{
 try{
  const favoriteDate = await this.demandeService.findAllDemandeByVendorAndState(VendorId, state)
  return response.status(HttpStatus.OK).json({
    message:"DemandeByUserIdAndStateUrl found successfully",
    status:HttpStatus.OK,
    data:favoriteDate
  })
 }catch
  (error){
    return response.status(HttpStatus.BAD_REQUEST).json({
      message:error.message,
      status:HttpStatus.BAD_REQUEST,
      data:null
    })
 } 
 }

 @Get('demandebyvendorid/:id')
 async GetDemandeByVendorIdUrl(@Param('id') UserId: string ,@Res() response): Promise<IDemande>{
 try{
  const favoriteDate = await this.demandeService.findAllDemandeByVendor(UserId)
  return response.status(HttpStatus.OK).json({
    message:"demandebyvendorid found successfully",
    status:HttpStatus.OK,
    data:favoriteDate
  })
 }catch
  (error){
    return response.status(HttpStatus.BAD_REQUEST).json({
      message:error.message,
      status:HttpStatus.BAD_REQUEST,
      data:null
    })
 } 
 }

 @Get("user/:id")
async getAllDemandebyUser(@Param('id') userId: string ,@Res() response) {
  try{
    const DemandeByuser=await this.demandeService.findAllDemandeByuser(userId);
    return response.status(HttpStatus.OK).json({
      message:'All Demande by User data found successfully',
      status:HttpStatus.OK,
      data:DemandeByuser
    })
  }catch (err){
    return response.status(HttpStatus.BAD_REQUEST).json({
      message:err,
      status:HttpStatus.BAD_REQUEST,
      data:null
    })
  }
}

// @Get("userVendor/:id")
// async getAllDemandebyVendor(@Param('id') userId: string ,@Res() response) {
//   try{
//     const DemandeByuser=await this.demandeService.findAllDemandeByVendor(userId);
//     return response.status(HttpStatus.OK).json({
//       message:'All Demande by User Vendor data found successfully',
//       status:HttpStatus.OK,
//       data:DemandeByuser
//     })
//   }catch (err){
//     return response.status(HttpStatus.BAD_REQUEST).json({
//       message:err,
//       status:HttpStatus.BAD_REQUEST,
//       data:null
//     })
//   }
// }

  @Get()
  async findAll(@Res() response) {
    try {
      const Pdata = await this.demandeService.findAll()
      return response.status(HttpStatus.OK).json({
        message: "Demande found successfully",
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
  async findOne(@Param('id') id: string, @Res() response) {
    try {
      const Pdata = await this.demandeService.findOne(id)
      return response.status(HttpStatus.OK).json({
        message: "Demande found successfully",
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

  @Patch(':id',)
  async update(@Param('id') id: string, @Body() updateDemandeDto: UpdateDemandeDto,@Res() response) {
    try {
      const Pdata = await this.demandeService.update(id, updateDemandeDto)

      return response.status(HttpStatus.OK).json({
        message: "Demande Updated successfully",
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
  async remove(@Param('id') id: string, @Res() response) {
    try {
      const pdata = await this.demandeService.remove(id)
      return response.status(HttpStatus.OK).json({
        message: "Demande Deleted successfully",

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
