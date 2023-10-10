import { Test, TestingModule } from '@nestjs/testing';
import { FacturesService } from './factures.service';

describe('FacturesService', () => {
  let service: FacturesService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [FacturesService],
    }).compile();

    service = module.get<FacturesService>(FacturesService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
