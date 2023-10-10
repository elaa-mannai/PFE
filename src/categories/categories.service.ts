import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { ICategorie } from './interfaces/categorie.interface';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';

@Injectable()
export class CategoriesService {

  constructor(@InjectModel('categories')
  private categoryModel: Model<ICategorie>) { }

  async createCategory(createCategoryDto: CreateCategoryDto): Promise<ICategorie> {
    const newCategory = new this.categoryModel(createCategoryDto)
    return await newCategory.save()
  }

  async findAllCategories(): Promise<ICategorie[]> {
    const categorieData = await this.categoryModel.find().exec()
    if (!categorieData || categorieData.length === 0) {
      throw new NotFoundException("Category Data not found")
    }
    return categorieData
  }
  async findOneCategory(categoryId: string): Promise<ICategorie> {
    const exsitingCategory = await this.categoryModel.findById(categoryId).exec()
    if (!exsitingCategory) {
      throw new NotFoundException("Categorie not found")
    }
    return exsitingCategory
  }

  async updateCategorie(categorieId: string, updateCategorieDto: UpdateCategoryDto): Promise<ICategorie> {
    const updateCategorie = await this.categoryModel.findByIdAndUpdate(categorieId, updateCategorieDto, { new: true });
    if (!updateCategorie) {
      throw new NotFoundException("Categorie not found ")
    }
    return updateCategorie
  }

  async deleteCategorieById(categorieId: string): Promise<ICategorie> {
    const deleteCategorie = await this.categoryModel.findByIdAndDelete(categorieId);
    if (!deleteCategorie) {
      throw new NotFoundException('Categorie not found')
    }
    return deleteCategorie
  }
}
