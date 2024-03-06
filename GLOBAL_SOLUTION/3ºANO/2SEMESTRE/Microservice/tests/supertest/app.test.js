const request = require('supertest');
const app = require('../../src/app');

describe("ODS3 Controller", ()=>{
    
    test('Checa conexão da API ODS3', async () => {
        const response = await request(app).get('/ODS3/listarODS3');   
        expect(response.statusCode).toBe(200);
    })    
})

describe("Indicador Controller", ()=>{

    var idIndicador = ["3.1","3.2","3.3","3.4","3.5","3.6","3.7","3.8","3.9"];

    test('A API retorna todas as propriedades estabelecidas para todos os Indicador/' + idIndicador[0], async () => {        
        const response = await request(app).get('/ODS3/listarId/' + idIndicador[0]);

        expect(response.statusCode).toBe(200);
        expect(response.body).toHaveProperty('id');
        expect(response.body).toHaveProperty('descricao');


        response.body.dados.forEach(dado => {            
            expect(dado).toHaveProperty('id_regiao');
            expect(dado).toHaveProperty('nomeRegiao');
            expect(dado).toHaveProperty('consumo');
            expect(dado).toHaveProperty('ano');
        })        

    })
})