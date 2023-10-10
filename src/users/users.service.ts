import { Injectable, NotFoundException, HttpException, HttpStatus } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { IUser } from './interfaces/user.interface';
import { IEvent } from 'src/events/interfaces/event.interface';


@Injectable()
export class UsersService {

  async findOneByUsername(username: string): Promise<IUser> {
    const user = this.userModel.findOne({ username });
    return user
  }
  constructor(@InjectModel('users') private userModel: Model<IUser>) { }


  async createUser(createUserDto: CreateUserDto): Promise<IUser> {
    const newUser = new this.userModel(createUserDto)
   
    return await newUser.save()
  }



  async findAllUsers(): Promise<IUser[]> {
    const userData = await this.userModel.find().exec()
    if (!userData || userData.length === 0) {
      throw new NotFoundException("Users Data not found")
    }
    return userData
  }

  async findOneUser(userId: string): Promise<IUser> {
    const exsitingUser = await this.userModel.findById(userId).exec()
    if (!exsitingUser) {
      throw new NotFoundException("User not found")
    }
    return exsitingUser
  }

  /*  async findOne(username: string): Promise<IUser | undefined> {
    return this.users.find(user => user.username === username);
  } */

  async findOneAndUpdateByEmail(email:any , password:any):Promise<IUser>{
    console.log(`password=${password}`);
    return this.userModel.findOneAndUpdate(email, password)
   }

  async updateUser(userId: string, updateUserDto: UpdateUserDto): Promise<IUser> {
    const updateUser = await this.userModel.findByIdAndUpdate(userId, updateUserDto, { new: true });
    if (!updateUser) {
      throw new NotFoundException("User not found ")
    }
    return updateUser
  }

  async deleteUserById(userId: string): Promise<IUser> {
    const deleteUser = await this.userModel.findByIdAndDelete(userId);
    if (!deleteUser) {
      throw new NotFoundException('user not found')
    }
    return deleteUser
  }
}
