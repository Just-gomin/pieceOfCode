import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';
import { MoviesService } from './movies.service';

@Controller('movies')
export class MoviesController {
  constructor(private readonly movieService: MoviesService) {}

  @Get()
  getAll() {
    return this.movieService.getAll();
  }

  @Get('/:id')
  getOne(@Param('id') movieId: string) {
    return this.movieService.getOne(+movieId);
  }

  @Post()
  create(@Body() movieData) {
    return this.movieService.create(movieData);
  }

  @Delete('/:id')
  delete(@Param('id') movieId: string) {
    return this.movieService.delete(movieId);
  }

  @Patch('/:id')
  update(@Param('id') movieId: string, @Body() updateData) {
    return this.movieService.update(movieId, updateData);
  }
}
