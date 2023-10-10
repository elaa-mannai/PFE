import { Controller, Get, Post, Body, Patch, Param, Delete, Res, HttpStatus } from '@nestjs/common';
import { GuestsService } from './guests.service';
import { CreateGuestDto } from './dto/create-guest.dto';
import { UpdateGuestDto } from './dto/update-guest.dto';
import { ApiTags } from '@nestjs/swagger';

@Controller('guests')
@ApiTags('guests')
export class GuestsController {
  constructor(private readonly guestsService: GuestsService) { }

  @Post()
  async createGuest(@Body() createGuestDto: CreateGuestDto, @Res() response) {
    try {
      const newGuest = await this.guestsService.createGuest(createGuestDto);
      return response.status(HttpStatus.CREATED).json({
        message: 'Guest created successfully',
        status: HttpStatus.CREATED,
        data: newGuest
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
  async findAllGuests(@Res() response) {
    try {
      const data = await this.guestsService.findAllGuests();
      return response.status(HttpStatus.OK).json({
        message: "Guests found successfully",
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
  async findOneGuest(@Param('id') id: string, @Res() response) {
    try {
      const data = await this.guestsService.findOneGuest(id)
      return response.status(HttpStatus.OK).json({
        message: "Guest found successfully",
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
  async updateGuest(@Param('id') idguest: string, @Body() updateGuestDto: UpdateGuestDto, @Res() response) {
    try {
      const data = await this.guestsService.updateGuest(idguest, updateGuestDto)
      return response.status(HttpStatus.OK).json({
        message: "Guest updated successfully",
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
  async removeGuest(@Param('id') id: string, @Res() response) {
    try {
      const data = await this.guestsService.removeGuest(id)
      return response.status(HttpStatus.OK).json({
        message: "Guest Deleted successfully",

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
