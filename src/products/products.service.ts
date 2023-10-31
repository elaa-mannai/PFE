import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { IProduct } from './interface/product.interface';
import { ICategorie } from 'src/categories/interfaces/categorie.interface';
import { IUser } from 'src/users/interfaces/user.interface';

@Injectable()
export class ProductsService {

  constructor(
  @InjectModel('products')
  private productModel: Model<IProduct>,
  @InjectModel('categories')
  private categoryModel: Model<ICategorie>,
  @InjectModel('users')
    private userModel: Model<IUser>,
  ) {

  }

  async createProduct(createProductDto: CreateProductDto): Promise<IProduct> {
    const newP = new this.productModel(createProductDto)
    await this.categoryModel.updateOne({_id:createProductDto.category},
       {$push:{products:newP._id}}).populate;
    await this.userModel.updateOne({ _id: createProductDto.user },
        { $push: { products: newP._id } })
  
    return await newP.save()
  }

  async findAllProducts(): Promise<IProduct[]> {
    const pdata = await this.productModel.find().exec()
    if (!pdata || pdata.length === 0) {
      //throw new NotFoundException("Products Data not found")
      return null
    }
    return pdata
  }

  async findOneProduct(productId: string): Promise<IProduct> {
    const pdata = await this.productModel.findById(productId).exec()
    if (!pdata) {
      throw new NotFoundException("Product not found")
    }
    return pdata
  }

  async updateProduct(productId: string, updateProductDto: UpdateProductDto) {
    const pdata = await this.productModel.findByIdAndUpdate(productId, updateProductDto, { new: true });
    if (!pdata) {
      throw new NotFoundException("Product not found ")
    }
    return pdata  }

  async removeProduct(productId: string) {
    const pdata= await this.productModel.findByIdAndDelete(productId);
    await this.categoryModel.updateOne({_id: pdata.category}, {$pull:{products:pdata._id}})
    if (!pdata) {
      throw new NotFoundException('Product not found')
    }
    return pdata  }



    async findAllProductsByuser(UserId: string):Promise<IProduct[]>
    {
      const ProductsData= await this.productModel.find({user :UserId})
      if (!ProductsData || ProductsData.length ==0 ){
     return null
      }
        return ProductsData;
      }

     /*  async findAllProductsByuserCustomer(UserId: string, favoriteProduct: Boolean):Promise<IProduct[]>
      {
        const ProductsData= await this.productModel.find({ UserId , favorite :favoriteProduct})
        if (!ProductsData || ProductsData.length ==0 ){
       return null
        }
       return  ProductsData;
        } */
  
    
}
