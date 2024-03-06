@echo off
docker stop $(docker ps -q)
docker rm $(docker ps -a -q)

docker network create redeTeste

docker run -d --rm --name ODS3 -p 3307:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=ODS3 -e MYSQL_USER=viniorsi -e MYSQL_PASSWORD=root --network redeTeste mysql:8.0-debian


cd BackEnd

docker build -t ods3api .
timeout /nobreak /t 10 >nul
docker run -p 8080:8080 -d --network redeTeste ods3api 


cd ..

cd frontend/frontend

docker build -t ods3front .
timeout /nobreak /t 10 >nul
docker run -p 32768:80 -d --network redeTeste ods3front

