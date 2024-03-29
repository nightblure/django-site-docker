# News Django Site

![Build Status](https://github.com/nightblure/django-site-docker/actions/workflows/main.yml/badge.svg?branch=main)
[![codecov](https://codecov.io/gh/nightblure/django-site-docker/branch/main/graph/badge.svg?token=7JFXGJJAF3)](https://codecov.io/gh/nightblure/django-site-docker)
[![Python 3.10](https://img.shields.io/badge/python-3.10-blue.svg)](https://www.python.org/downloads/release/python-3100/)

![img.png](img.png)

This project implements a small Django news site.
* Data Storage - ```PostgreSQL```
* E-mail notifications - ```Celery```
* REST API - ```Django REST Framework```
* Dependencies manager - ```Poetry```
* Web Server - ```NGINX``` & ```Gunicorn```
* Caching - ```Redis```
* Deployment - ```Docker Hub``` & ```Github Actions```
* Tests - ```pytest``` & ```mixer```
* Code style - ```flake8```
* Monitoring: ```flower```, ```Grafana``` & ```Prometheus```
* Logging: ```Sentry```

## Files:
  - ```Makefile``` - file with all commands
  - ```dump.sql``` - ```PostgreSQL``` dump in ```SQL``` format
  - ```Dockerfile.yml``` - Dockerfile
  - ```docker-compose.yml``` - file for deployment ```Docker``` containers
  - ```.docker/.env``` - env variables
  - ```src/.flake8``` - ```flake8``` linter config file
  - ```src/.coveragerc``` - coverage config file
  - ```src/pytest.ini``` - ```pytest``` config file

## Local run:

Install dependencies:

```bash
make deps
```

Run ```Celery```:

```bash
make celery
```

```flower```:
```bash
make flower
```

Run server:
```bash
make server
```

Linter checks:
```bash
make linter
```

Tests:

```bash
make tests
```

* cli coverage report: ```pytest --cov-report term-missing -rs --cov=.```
* cli and html coverage report: ```pytest --cov-report html --cov=.```
* define exclude files for coverage in ```src/.coveragerc```

## Local run with Docker:
  1. [Clone repository](https://github.com/nightblure/django-site-docker.git)
  2. Define DB name in .env if need custom name (variable ```POSTGRES_DB```)
  3. Deploy with command ```make up```
  4. [Check address](http://localhost:80/)

