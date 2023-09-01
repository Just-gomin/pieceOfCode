import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CatsModule } from './cats/cats.module';
import { MoviesModule } from './movies/movies.module';

@Module({
  imports: [CatsModule, MoviesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
