import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Ods3Service } from 'src/app/services/ods3.service';

@Component({
  selector: 'app-objetivos',
  templateUrl: './objetivos.component.html',
  styleUrls: ['./objetivos.component.scss']
})
export class ObjetivosComponent {
  objetivos: any[] = [];
  objetivo: any;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private ods3Service: Ods3Service
  ) {}

  ngOnInit() {
    this.ods3Service.getODS3().subscribe(
      (data) => {
        this.objetivos = data.content;
        const objetivoId = this.route.snapshot.paramMap.get('id');
        if (objetivoId !== null) {
          this.objetivo = this.getObjetivoById(objetivoId);
        } else {
          console.error('ID do objetivo é nulo.');
        }
      },
      (error) => {
        console.error('Erro ao obter dados:', error);
      }
    );
  }

  getObjetivoById(id: string) {
    return this.objetivos.find(objetivo => objetivo.id === id);
  }

  openMetricsScreen() {
    this.router.navigate(['/metricas'], { queryParams: { id: this.objetivo.id } });
  }

  goBack(){
    this.router.navigate(['']);
  }
}
