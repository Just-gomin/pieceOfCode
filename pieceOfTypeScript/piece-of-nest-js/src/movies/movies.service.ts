import { Injectable } from '@nestjs/common';
import { Movie } from './entities/movie.entity';

@Injectable()
export class MoviesService {
  private movies: Movie[] = [];

  getAll(): Movie[] {
    return this.movies;
  }

  getOne(movieId: number): Movie | undefined {
    return this.movies.find((movie) => movie.id === movieId);
  }

  create(movieData) {
    this.movies.push({
      id: this.movies.length + 1,
      ...movieData,
    });
    return true;
  }

  delete(movieId) {
    this.movies = this.movies.filter((movie) => movie.id !== movieId);
    return true;
  }

  update(movieId, updateData) {
    const i = this.movies.findIndex((movie) => movie.id === movieId);
    this.movies[i] = { id: movieId, ...updateData };
    return true;
  }
}
