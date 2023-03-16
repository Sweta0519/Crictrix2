import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FlashhandbookComponent } from './flashhandbook.component';

describe('FlashhandbookComponent', () => {
  let component: FlashhandbookComponent;
  let fixture: ComponentFixture<FlashhandbookComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FlashhandbookComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FlashhandbookComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
