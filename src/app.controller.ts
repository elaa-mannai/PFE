import { Body, Controller, Get, Param, Post, Res, StreamableFile } from '@nestjs/common';
import { AppService } from './app.service';
import { join } from 'path';
import { createReadStream } from 'fs';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService
  ) { }



  @Get("file/:folder/:img")
  getfile(@Param('img') img, @Param('folder') folder): StreamableFile {
    const file = createReadStream(join(process.cwd(), './upload/'+folder+'/'+img))
    return new StreamableFile(file);
  }



}
