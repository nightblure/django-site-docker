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

## Local run of the project:
  1. ```git clone https://github.com/nightblure/django-site-docker.git```
  2. Activate ```Poetry``` virtual environment: ```poetry shell```
  3. Install dependencies: ```poetry install```
  4. Run ```Celery```: ```celery -A project worker -l info -P solo```   

## Local deployment with Docker:
  1. [Clone repository](https://github.com/nightblure/django-site-docker.git)
  2. Define DB name in .env if need custom name (variable ```POSTGRES_DB```)
  3. Deploy with command ```docker-compose up --build -d```
  4. [Run app](http://localhost:80/)
  5. ```flake8``` code linter: ```flake8 .```
  6. Tests: ```pytest -rs```

