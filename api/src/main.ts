import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import * as session from 'express-session';
import * as passport from 'passport';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const config = new DocumentBuilder()
    .setTitle('Event Application')
    .setDescription('API')
    .setVersion('1.0')
    .addTag('auth')
    .addTag('users')
    .addTag('vendors')
    .addTag('customers')
    .addTag('categories')
    .addTag('products')
    .addTag('events')
    .addTag('factures')
    .addTag('guests')
    .addTag('favorites')

    .addBearerAuth(
      {
        description:`please enter token in following format : Bearer<JWT>`,
        name:'authorization',
        bearerFormat:'Bearer',
        scheme:'Bearer',
        type:'http',
        in:'Header'
      },
      'access-token'
    )
    
    .build(); 
    app.use(
      session({
        secret: 'YOUR_SESSION_SECRET',
        resave: false,
        saveUninitialized: false,
      }),
    );
    

    const document = SwaggerModule.createDocument(app, config);
    SwaggerModule.setup('api', app, document);
    app.enableCors();
    app.use(passport.initialize());
    app.use(passport.session());
    await app.listen(3000);
}

bootstrap();
