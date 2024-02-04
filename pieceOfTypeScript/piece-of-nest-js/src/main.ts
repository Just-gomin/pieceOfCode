import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';
import { ConfigKey } from './core/config/enum/config-key.enum';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  const configService = app.get(ConfigService);

  console.log(configService.get(ConfigKey.testValue));

  await app.listen(3000);
}
bootstrap();
