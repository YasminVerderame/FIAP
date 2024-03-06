import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrModule } from 'ngx-toastr';
import { HomeComponent } from './pages/home/home.component';
import { Ods3Service } from './services/ods3.service';
import { MetricasIndicadoresComponent } from './pages/metricas-indicadores/metricas-indicadores.component';
import { ObjetivosComponent } from './pages/objetivos/objetivos.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    MetricasIndicadoresComponent,
    ObjetivosComponent,
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    ToastrModule.forRoot({
      timeOut: 5000,
      iconClasses: {
        error: 'custom-toast-error',
        info: 'ngx-toastr-info',
        success: 'custom-toast-success',
        warning: 'ngx-toastr-warning'
      }
    }),
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [Ods3Service],
  bootstrap: [AppComponent]
})
export class AppModule { }
