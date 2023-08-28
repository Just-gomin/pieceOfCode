import { Module } from '@nestjs/common';
import { CatsService } from './cats.service';
import { CatsController } from './cats.controller';

@Module({
  controllers: [CatsController], // 해당 모듈에서 사용하는 Controller들 명시
  providers: [CatsService], // Controller에서 사용하는 Provider들을 명시 => Service, Repositories, Factories, Helpers, and so on.
})
export class CatsModule {}
