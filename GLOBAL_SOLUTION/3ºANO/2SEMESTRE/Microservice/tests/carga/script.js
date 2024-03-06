import { sleep } from 'k6';
export const options = {
    vus: 100,
    duration: '5m',
};


export default function () {
    let responseListarODS3 = http.get('http://localhost:8080/ODS3/listarODS3');
    if (responseListarODS3.status !== 200) {
      console.error(`Falha ao acessar listarODS3. Código de status: ${responseListarODS3.status}`);
    }
    sleep(1);
  
    let responseListarId = http.get('http://localhost:8080/ODS3/listarId/3.1');
    if (responseListarId.status !== 200) {
      console.error(`Falha ao acessar listarId/3.1. Código de status: ${responseListarId.status}`);
    }
    sleep(1);
}