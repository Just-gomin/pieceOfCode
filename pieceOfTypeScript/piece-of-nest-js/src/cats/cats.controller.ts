import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Req,
  HttpCode,
  Header,
  Redirect,
  Res,
  HttpStatus,
} from '@nestjs/common';
import { CatsService } from './cats.service';
import { CreateCatDto } from './dto/create-cat.dto';
import { UpdateCatDto } from './dto/update-cat.dto';
import { Request, Response } from 'express';

@Controller('cats')
export class CatsController {
  constructor(private readonly catsService: CatsService) {}

  @Get('ab*cd') // Route 와일드 카드 => '/cats/ab*cd' 처리
  @Redirect('https://nestjs.com', 301) // Status Code와 함께 Redirection
  wildCard() {
    return 'This route uses a wildcard and redirect to https://nestjs.com.';
  }

  @Post() // "/cats" POST HTTP 요청의 endpoint
  @HttpCode(204) // Overrides default status code for the decorated request method.
  @Header('Cache-Control', 'none') // Specify a custom response header
  create(@Body() createCatDto: CreateCatDto) {
    return this.catsService.create(createCatDto);
  }

  @Get() // "/cats" GET HTTP 요청의 endpoint
  findAll(@Req() request: Request) {
    // @Req 데코레이터를 이용해 요청 객체에 접근할 수 있다.
    console.log(request.headers);
    return this.catsService.findAll();
  }

  @Get(':id') // '/cats/[CatID]' 경로 요청 시 처리. id 값 처리
  findOne(@Param('id') id: string) {
    return this.catsService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateCatDto: UpdateCatDto) {
    return this.catsService.update(+id, updateCatDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.catsService.remove(+id);
  }

  @Get('breed/:id') // '/cats/breed" Get HTTP 요청의 endpoint
  breed(@Param('id') id: string, @Res() res: Response) {
    res.status(HttpStatus.OK).send(`Breeding cat.(id: ${id})`);
    return 'breed...';
  }
}
