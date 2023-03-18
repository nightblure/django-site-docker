# News Django Site

![Build Status](https://github.com/nightblure/django-site-docker/actions/workflows/main.yml/badge.svg?branch=main)

This project implements a small Django news site.
* Data Storage - ```PostgreSQL```
* E-mail notifications - ```Celery```
* REST API - ```Django REST Framework```
* Dependencies manager - ```Poetry```
* Web Server - ```NGINX``` & ```Gunicorn```
* Caching - ```Redis```
* Deployment - ```Docker Hub``` & ```Github Actions```

### Files:
  - ```dump.sql``` - DB dump in ```SQL```-format
  - ```Dockerfile.yml``` - main image Dockerfile
  - ```docker-compose.yml``` - file for deployment ```Docker``` containers
  - ```.docker/.env (далее .env)``` - env vars file
  - ```.flake8``` - ```flake8``` config file

### Local run of the project:
  1. ```git clone https://github.com/nightblure/django-site-docker.git```
  2. Activate ```poetry```: ```poetry shell```
  3. Install dependencies: ```poetry install```

## Local deployment with Docker:
  1. [Clone repository](https://github.com/nightblure/django-site-docker.git)
  2. Define DB name in .env if need custom name (variable ```POSTGRES_DB```)
  3. Deploy with command ```docker-compose up --build -d```
  4. [Run app](http://localhost:80/)
  5. ```flake8``` code linter: ```flake8 .```
  6. tests: ```pytest -rs```

## Примечания:
  * Миграции не нужны, т.к. в репозитории лежит дамп БД, в нем уже есть все таблицы с данными и системные таблицы Django
  * Если нужно поменять имя контейнера ```PostgreSQL``` в ```docker-compose```, то также нужно не забыть записать его в переменную ```HOST``` в .env
  * Конфиг ```nginx.conf``` должен лежать в директории ```/etc/nginx```
  * Конфиг ```appconfig.conf``` должен лежать в директории ```/etc/nginx/conf.d```
  * Запуск ```celery```: ```celery -A project worker -l info -P solo```

