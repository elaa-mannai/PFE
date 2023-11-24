import { Test, TestingModule } from '@nestjs/testing';
import { DemandeController } from './demande.controller';
import { DemandeService } from './demande.service';

describe('DemandeController', () => {
  let controller: DemandeController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [DemandeController],
      providers: [DemandeService],
    }).compile();

    controller = module.get<DemandeController>(DemandeController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
