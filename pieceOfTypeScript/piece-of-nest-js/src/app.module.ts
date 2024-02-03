import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { ConfigKey } from './core/config/enum/config-key.enum';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: process.env[ConfigKey.nodeEnv]
        ? `env/.${process.env[ConfigKey.nodeEnv]}.env`
        : 'env/.local.env',
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
