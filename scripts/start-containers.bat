
docker pull mcr.microsoft.com/mssql/server:2019-latest

docker compose -f infrastructure/dev/docker-compose.yml up --build