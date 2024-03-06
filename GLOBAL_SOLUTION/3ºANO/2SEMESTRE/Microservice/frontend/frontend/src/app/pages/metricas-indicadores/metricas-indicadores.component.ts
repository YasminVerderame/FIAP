import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Ods3Service } from 'src/app/services/ods3.service';

@Component({
  selector: 'app-metricas-indicadores',
  templateUrl: './metricas-indicadores.component.html',
  styleUrls: ['./metricas-indicadores.component.scss']
})
export class MetricasIndicadoresComponent {

  selectedId: number = 1;
  indicadores: any[] = [];
  filteredIndicadores: any[] = [];

  constructor(
    private route: ActivatedRoute,
    private ods3Service: Ods3Service
  ) {}

  ngOnInit() {
    const id = this.route.snapshot.queryParams['id'];

    this.ods3Service.getIndicadoresByID(id).subscribe((dados) => {
      this.indicadores = dados.indicadores;

      if (this.indicadores.length > 0) {
        this.selectedId = this.indicadores[0].id;
      }
    });
  }

  toggleIndicador(id: number): void {
    this.selectedId = id;
  }
}