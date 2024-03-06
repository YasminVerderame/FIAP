# GS1-MICROSERVICE

1-O sistema deverá possuir uma tela para inclusão, alteração e listagem onde seja possível gerenciar os dados de drone listados acima.

2- Os dados deverão ser persistidos em uma base de dados

3- O acesso as telas de gestão do drone deverá ser permitido somente aos usuários com a role “drone-admin”

4- O sistema deverá ter dois endpoints rest que receberão os dados de telemetria coletados pelo drone;

5- Os dados de telemetria deverão ser persistidos em base de dados

6- O acesso aos endpoints deverão ser protegidos por duas roles: a) o endpoint de gravação pela role “drone-seed”; b) o endpoint de leitura pela role “telemetria-reader”
