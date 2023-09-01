import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
  Query,
} from '@nestjs/common';

@Controller('movies')
export class MoviesController {
  @Get()
  getAll() {
    return 'This will return all movies';
  }

  @Get('search')
  search(@Query('title') title?: string, @Query('year') year?: string) {
    let result: string = 'We are searching for a movie with a';
    if (title) result += ` ${title}`;
    if (year) result += `, ${year}`;
    result += '.';
    return result;
  }

  @Get('/:id')
  getOne(@Param('id') movieId: string) {
    return `This will return specific movie. ID: ${movieId}`;
  }

  @Post()
  create(@Body() movieData) {
    return movieData;
  }

  @Delete('/:id')
  delete(@Param('id') movieId: string) {
    return `This will delete a movie. ID: ${movieId}`;
  }

  @Patch('/:id')
  update(@Param('id') movieId: string, @Body() updateData) {
    return updateData;
  }
}
