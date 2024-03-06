import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { MetricasIndicadoresComponent } from './pages/metricas-indicadores/metricas-indicadores.component';
import { ObjetivosComponent } from './pages/objetivos/objetivos.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'metricas', component: MetricasIndicadoresComponent },
  { path: 'objetivos/:id', component: ObjetivosComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
