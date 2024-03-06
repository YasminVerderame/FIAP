import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MetricasIndicadoresComponent } from './metricas-indicadores.component';

describe('MetricasIndicadoresComponent', () => {
  let component: MetricasIndicadoresComponent;
  let fixture: ComponentFixture<MetricasIndicadoresComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [MetricasIndicadoresComponent]
    });
    fixture = TestBed.createComponent(MetricasIndicadoresComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
