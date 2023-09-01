import { Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';

@Controller('movies')
export class MoviesController {
  @Get()
  getAll() {
    return 'This will return all movies';
  }

  @Get('/:id')
  getOne(@Param('id') movieId: string) {
    return `This will return specific movie. ID: ${movieId}`;
  }

  @Post()
  create() {
    return `This will create movie.`;
  }

  @Delete('/:id')
  delete(@Param('id') movieId: string) {
    return `This will delete a movie. ID: ${movieId}`;
  }

  @Patch('/:id')
  update(@Param('id') movieId: string) {
    return `This will update a movie. ID: ${movieId}`;
  }
}
