import { Test, TestingModule } from '@nestjs/testing';
import { DemandeService } from './demande.service';

describe('DemandeService', () => {
  let service: DemandeService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [DemandeService],
    }).compile();

    service = module.get<DemandeService>(DemandeService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
