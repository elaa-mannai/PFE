import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MongooseModule } from '@nestjs/mongoose';
import { UsersModule } from './users/users.module';
import { UsersService } from './users/users.service';
import { CategoriesModule } from './categories/categories.module';
import { EventsModule } from './events/events.module';
import { VendorsModule } from './vendors/vendors.module';
import { CustomersModule } from './customers/customers.module';
import { FacturesModule } from './factures/factures.module';
import { ProductsModule } from './products/products.module';
import { AuthModule } from './auth/auth.module';
import { ConfigModule } from '@nestjs/config';
import { AdminModule } from './admin/admin.module';
import { GuestsModule } from './guests/guests.module';
import { MailerModule } from '@nestjs-modules/mailer';
import { HandlebarsAdapter } from '@nestjs-modules/mailer/dist/adapters/handlebars.adapter';
import { join } from 'path';
import { SocketModule } from './socket/socket.module';

@Module({
  imports: [MongooseModule.forRoot("mongodb://127.0.0.1:27017", { dbName: "weddingmanagment" }),
    UsersModule,
    CategoriesModule,
    EventsModule,
    VendorsModule,
    CustomersModule,
    FacturesModule, ProductsModule, AuthModule,
  ConfigModule.forRoot({ isGlobal: true }),
    AdminModule,
    GuestsModule,
    SocketModule,
  MailerModule.forRoot({
    transport: {
      host: "sandbox.smtp.mailtrap.io",
      port: 2525,
      auth: {
        user: "bcdfa041050f89",
        pass: "89d507c9421ddd"
      }
    },
    defaults: {
      from: ' "No reply" <noreply@example.com>'
    },
    template: {
      dir: join(__dirname, 'templates'),
      adapter: new HandlebarsAdapter(),
      options: {
        strict: true
      }
    }
  }),

],

  controllers: [AppController],
  providers: [AppService,],
})
export class AppModule { }
