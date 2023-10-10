import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateFactureDto } from './dto/create-facture.dto';
import { UpdateFactureDto } from './dto/update-facture.dto';
import { InjectModel } from '@nestjs/mongoose';
import { IFacture } from './interfaces/facture.interface';
import { Model } from 'mongoose';
import { IEvent } from 'src/events/interfaces/event.interface';

@Injectable()
export class FacturesService {

  constructor(
    @InjectModel('factures')
    private facturesModel: Model<IFacture>,
  ) { }


  async create(createFactureDto: CreateFactureDto): Promise<IFacture> {
    const newFacture = new this.facturesModel(createFactureDto)
    return await newFacture.save()
  }


  async findAll(): Promise<IFacture[]> {
    const dataFacture = await this.facturesModel.find().exec()
    if (!dataFacture || dataFacture.length === 0) {
      throw new NotFoundException("Facture Data not found")
    }
    return dataFacture
  }

  async findOne(factureId: string): Promise<IFacture> {
    const dataFacture = await this.facturesModel.findById(factureId).exec()
    if (!dataFacture) {
      throw new NotFoundException("Facture Data not found")
    }
    return dataFacture
  }

  async update(factureId: string, updateFactureDto: UpdateFactureDto): Promise<IFacture> {
    const dataFacture = await this.facturesModel.findByIdAndUpdate(factureId, updateFactureDto, { new: true });
    if (!dataFacture) {
      throw new NotFoundException("Facture not found ")
    }
    return dataFacture
  }

  async remove(factureId: string) {
    const dataFacture = await this.facturesModel.findByIdAndDelete(factureId);
    if (!dataFacture) {
      throw new NotFoundException('Facture not found')
    }
    return dataFacture
  }
}
