import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResultProfileComponent } from './result-profile.component';

describe('ResultProfileComponent', () => {
  let component: ResultProfileComponent;
  let fixture: ComponentFixture<ResultProfileComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ResultProfileComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ResultProfileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
