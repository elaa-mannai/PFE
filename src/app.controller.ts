import { Body, Controller, Get, Param, Patch, Post, Res, StreamableFile, UploadedFile, UseInterceptors } from '@nestjs/common';
import { AppService } from './app.service';
import { join } from 'path';
import { createReadStream } from 'fs';
import { FileInterceptor } from '@nestjs/platform-express';

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

  /* @Patch(':folder/:img') // Change @Get to @Patch
  @UseInterceptors(FileInterceptor('image', { storage: './upload/'+folder+'/'+img }))
  async updateImage(
    @Param('img') img,
    @Param('folder') folder,
    @UploadedFile() file
  ) {
    try {
      // Handle the updated image here
      // For example, save the updated file to a specific directory
      const updatedImagePath = `./upload/${folder}/${img}`;
      await fs.promises.writeFile(updatedImagePath, file.buffer);

      // Assuming the update was successful
      return { message: 'Image updated successfully' };
    } catch (error) {
      // Handle any errors that occur during the update
      return { message: 'Image update failed', error: error.message };
    }
  } */


}
