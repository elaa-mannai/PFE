import { Controller, Get, Post, Body, Patch, Param, Delete, HttpStatus, Res, UseGuards } from '@nestjs/common';
import { EventsService } from './events.service';
import { CreateEventDto } from './dto/create-event.dto';
import { UpdateEventDto } from './dto/update-event.dto';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger/dist/decorators';
import { AccessTokenGuard } from 'src/common/guards/accessTokenGuard';

@Controller('events')
@ApiTags('events')
export class EventsController {
  constructor(private readonly eventsService: EventsService) {}

  @ApiBearerAuth('access-token')
  @UseGuards(AccessTokenGuard)
  @Post()
  async createEvent(@Body() createEventDto: CreateEventDto, @Res() response){
    try{
     const newEvent=await this.eventsService.createEvent(createEventDto)
      return response.status(HttpStatus.CREATED).json({
        message:'Event created successfully',
        status:HttpStatus.CREATED,
        data:newEvent
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
  async findAllEvents(@Res() response) {
    try {
      const EventData= await this.eventsService.findAllEvents()
      return response.status(HttpStatus.OK).json({
        message:"Events found successfully",
        status:HttpStatus.OK,
        data:EventData
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
  async findOne(@Res() response ,@Param('id') eventId: string) {
    try {
      const exsitingEvent =await this.eventsService.findOneEvent(eventId)
      return response.status(HttpStatus.OK).json({
        message:"Event found successfully",
        status:HttpStatus.OK,
        data:exsitingEvent
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
  async update(@Res() response,@Param('id') eventId: string, @Body() updateEventDto: UpdateEventDto) {

    try {
      const updatedEvent=await this.eventsService.updateEvent(eventId, updateEventDto)
      return response.status(HttpStatus.OK).json({
        message:"Event Updated successfully",
        status:HttpStatus.OK,
        data:updatedEvent
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
 async remove(@Res() response,@Param('id') eventId: string) {
    try {
      
      const deleteEvent=await  this.eventsService.deleteEventById(eventId)

      return response.status(HttpStatus.OK).json({
        message:"Event Deleted successfully",
      
      })
    } catch (error) {
       return response.status(HttpStatus.BAD_REQUEST).json({
        message:error.message,
        status:HttpStatus.BAD_REQUEST,
        data:null
      })
    }
  }



  @Get("user/:id")
  async getAllEventsbyuser(@Param('id') UserId: string ,@Res() response) {
    try{
      const EventData=await this.eventsService.findAllEventsByuser(UserId);
      return response.status(HttpStatus.OK).json({
        message:'All Events data found successfully',
        status:HttpStatus.OK,
        data:EventData
      })
    }catch (err){
      return response.status(HttpStatus.BAD_REQUEST).json({
        message:err,
        status:HttpStatus.BAD_REQUEST,
        data:null
      })
    }
  }





}
