import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class Ods3Service {
  private apiUrl = 'http://localhost:8080/ODS3';

  constructor(private http: HttpClient) { }

  getODS3(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/listarODS3`)
    .pipe(
      tap(data => console.log('Lista ODS 3:', data)),
      catchError(error => {
        console.error('Erro ao buscar lista:', error);
        throw error;
      })
    );
  }

  getIndicadoresByID(id: number): Observable<any> {
    return this.http.get(`${this.apiUrl}/listarId/${id}`,)
    .pipe(
      tap(data => console.log('Lista por ID', data)),
      catchError(error => {
        console.error('Erro ao buscar id:', error);
        throw error;
      })
    );
  }
}