import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Ods3Service } from '../../services/ods3.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})

export class HomeComponent {
  objetivos: any[] = []; 

  constructor(
    private ods3Service: Ods3Service,
    private router: Router) 
  { }

  ngOnInit(): void {
    this.carregarObjetivos();
  }

  carregarObjetivos() {
    this.ods3Service.getODS3().subscribe(
      (data) => {
        this.objetivos = data.content;
      },
      (error) => {
        console.error('Erro ao obter dados:', error);
      }
    );
  }

  openObjetivos(id: string) {
    this.router.navigate(['/objetivos', id]);
  }
}
