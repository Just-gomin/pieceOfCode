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
        ? `env/.${process.env[ConfigKey.nodeEnv]}.env` // NODE_ENV 별 다른 파일
        : 'env/.local.env', // NODE_ENV가 주어지지 않는 경우 .local.env로 처리
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
