import { TestBed } from '@angular/core/testing';

import { FeeStudentService } from './fee-student.service';

describe('FeeStudentService', () => {
  let service: FeeStudentService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(FeeStudentService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
