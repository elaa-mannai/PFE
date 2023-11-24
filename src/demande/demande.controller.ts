import { Controller, Get, Post, Body, Patch, Param, Delete, HttpStatus, Res } from '@nestjs/common';
import { DemandeService } from './demande.service';
import { CreateDemandeDto } from './dto/create-demande.dto';
import { UpdateDemandeDto } from './dto/update-demande.dto';
import { ApiTags } from '@nestjs/swagger';
import { response } from 'express';

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
