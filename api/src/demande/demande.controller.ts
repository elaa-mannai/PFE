import { Body, Controller, Delete, Get, HttpStatus, Param, Patch, Post, Res } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { DemandeService } from './demande.service';
import { CreateDemandeDto } from './dto/create-demande.dto';
import { UpdateDemandeDto } from './dto/update_demande.dto';

@Controller('demande')
@ApiTags('demande')
export class DemandeController {
    constructor(private readonly demandeService: DemandeService){}

    @Post()
    async createDemande(@Body() createDemandeDto: CreateDemandeDto, @Res() response) {
      try {
        const newdemande = await this.demandeService.create(createDemandeDto);
        return response.status(HttpStatus.CREATED).json({
          message: 'demande created successfully',
          status: HttpStatus.CREATED,
          data: newdemande
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
    async findAllDemande(@Res() response) {
      try {
        const data = await this.demandeService.findAll();
        return response.status(HttpStatus.OK).json({
          message: "demande found successfully",
          status: HttpStatus.OK,
          data: data
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
    async findOneDemande(@Param('id') id: string, @Res() response) {
      try {
        const data = await this.demandeService.findOne(id)
        return response.status(HttpStatus.OK).json({
          message: "Demande found successfully",
          status: HttpStatus.OK,
          data: data
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
    async updateDemande(@Param('id') idDemnade: string, @Body() updateDemande: UpdateDemandeDto, @Res() response) {
      try {
        const data = await this.demandeService.update(idDemnade, updateDemande)
        return response.status(HttpStatus.OK).json({
          message: "Demande updated successfully",
          status: HttpStatus.OK,
          data: data
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
    async removeDemande(@Param('id') id: string, @Res() response) {
      try {
        const data = await this.demandeService.remove(id)
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
