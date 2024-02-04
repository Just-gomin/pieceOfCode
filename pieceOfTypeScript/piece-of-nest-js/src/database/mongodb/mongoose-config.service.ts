import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import {
  MongooseModuleOptions,
  MongooseOptionsFactory,
} from '@nestjs/mongoose';
import { ConfigKey } from 'src/core/config/enum/config-key.enum';

@Injectable()
export class MongooseConfigService implements MongooseOptionsFactory {
  constructor(private readonly configService: ConfigService) {}

  createMongooseOptions(): MongooseModuleOptions {
    const uri = `mongodb://${this.configService.get(
      ConfigKey.mongoDBInitUserName,
    )}:${this.configService.get(
      ConfigKey.mongoDBInitPassword,
    )}@${this.configService.get(
      ConfigKey.mongoDBHost,
    )}:${this.configService.get(
      ConfigKey.mongoDBPort,
    )}/${this.configService.get(ConfigKey.mongoDBInitDatabse)}`;

    return {
      uri,
    };
  }
}
