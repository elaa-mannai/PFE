import { Module } from '@nestjs/common';
import { UsersService } from './users.service';
import { UsersController } from './users.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { userSchema } from './entities/user.entity';
import { Customer, customerSchema } from 'src/customers/entities/customer.entity';
import { Vendor, vendorSchema } from 'src/vendors/entities/vendor.entity';
import { Admin, adminSchema } from 'src/admin/entities/admin.entity';
import { eventSchema } from 'src/events/entities/event.entity';

@Module({
  imports: [MongooseModule.forFeature([{
    name: 'users', schema: userSchema,
    discriminators:
      [
        { name: Customer.name, schema: customerSchema },
        { name: Vendor.name, schema: vendorSchema },
        { name: Admin.name, schema: adminSchema }
      ]
  }])
  ],
  controllers: [UsersController],
  providers: [UsersService],
  exports: [UsersService]
})
export class UsersModule { }
