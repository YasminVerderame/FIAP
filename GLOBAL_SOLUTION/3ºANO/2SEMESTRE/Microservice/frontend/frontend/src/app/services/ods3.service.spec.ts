import { TestBed } from '@angular/core/testing';

import { Ods3Service } from './ods3.service';

describe('ODS3Service', () => {
  let service: Ods3Service;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(Ods3Service);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
