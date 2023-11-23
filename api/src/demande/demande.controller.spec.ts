import { Test, TestingModule } from '@nestjs/testing';
import { DemandeController } from './demande.controller';

describe('DemandeController', () => {
  let controller: DemandeController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [DemandeController],
    }).compile();

    controller = module.get<DemandeController>(DemandeController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
