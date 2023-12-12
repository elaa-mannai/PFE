import { Injectable, NotFoundException, HttpException, HttpStatus } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { IUser } from './interfaces/user.interface';
import { IEvent } from 'src/events/interfaces/event.interface';
import * as admin from 'firebase-admin';

@Injectable()
export class UsersService {
  private readonly admin: admin.app.App;
 
  
  constructor(@InjectModel('users') private userModel: Model<IUser>,
  ) { 
    const serviceAccount = require('../../eventmangaement-firebase-adminsdk-yl0ia-c536dcfde7.json');
    this.admin = admin.initializeApp({
      credential: admin.credential.cert(serviceAccount),
      // Other options if necessary
    });
  }



  async createUser(createUserDto: CreateUserDto): Promise<IUser> {
    const newUser = new this.userModel(createUserDto)
   
    return await newUser.save()
  }

   async findOneByUsername(username: string): Promise<IUser> {
    const user = this.userModel.findOne({ username });
    return user
  }

 /*  async findByGoogleId(googleId: string): Promise<IUser | null> {
    return this.userModel.findOne({ googleId }).exec();
  }
 */
  async findAllUsers(): Promise<IUser[]> {
    const userData = await this.userModel.find().exec()
    if (!userData || userData.length === 0) {
      throw new NotFoundException("Users Data not found")
    }
    return userData
  }

  async findOneUser(userId: string): Promise<IUser> {
    const exsitingUser = await this.userModel.findById(userId).populate({path:'demande'}).populate({path:'favorites'}).exec();
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

////////////////////////firebase function

async sendNotification(title: string, body: string, token: string): Promise<any> {
  const message = {
    notification: {
      title,
      body,
    },
    token,
  };
  try {
    const response = await this.admin.messaging().send(message);
    console.log('Notification sent successfully:', response);
    return response;
  } catch (error) {
    console.error('Error sending notification:', error);
    throw error;
  }
}
}

