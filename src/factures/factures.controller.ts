import { Controller, Get, Post, Body, Patch, Param, Delete, Res, HttpStatus } from '@nestjs/common';
import { FacturesService } from './factures.service';
import { CreateFactureDto } from './dto/create-facture.dto';
import { UpdateFactureDto } from './dto/update-facture.dto';
import { ApiTags } from '@nestjs/swagger/dist/decorators';

@Controller('factures')
@ApiTags('factures')
export class FacturesController {
  constructor(private readonly facturesService: FacturesService) { }

  @Post()
  async createFacture(@Body() createFactureDto: CreateFactureDto, @Res() response) {
    try {
      const newFacture = await this.facturesService.create(createFactureDto);
      return response.status(HttpStatus.CREATED).json({
        message: 'Facture created successfully',
        status: HttpStatus.CREATED,
        data: newFacture
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
  async findAllFactures(@Res() response) {
    try {
      const dataFacture = await this.facturesService.findAll();
      return response.status(HttpStatus.OK).json({
        message: "Factures found successfully",
        status: HttpStatus.OK,
        data: dataFacture
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
  async findOne(@Res() response, @Param('id') factureId: string) {
    try {
      const data = await this.facturesService.findOne(factureId)
      return response.status(HttpStatus.OK).json({
        message: "Facture found successfully",
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
  async update(@Res() response, @Param('id') factureId: string, @Body() updateFactureDto: UpdateFactureDto) {
    try {
      const data = await this.facturesService.update(factureId, updateFactureDto)
      return response.status(HttpStatus.OK).json({
        message: "Facture updated successfully",
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
  async remove(@Param('id') factureId: string, @Res() response) {
    try {
      const data = await this.facturesService.remove(factureId)
      return response.status(HttpStatus.OK).json({
        message: "Facture Deleted successfully",

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
