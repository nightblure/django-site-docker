# News Django Site

![Build Status](https://github.com/nightblure/django-site-docker/actions/workflows/main.yml/badge.svg?branch=main)

Этот проект реализует небольшой новостной сайт на Django
* Database - ```PostgreSQL```
* E-mail notifications - ```Celery + Redis```
* REST API - ```Django REST Framework```
* Dependencies manager - ```Poetry```
* Web Server (in Docker container) - ```NGINX```
* Caching - ```Redis```

Работать с приложением можно локально из IDE и из docker-контейнера

## Описание файлов:
  - ```dump.sql``` - любой sql-скрипт. Он будет примонтирован к специальной директории (см. файл docker-compose), в которой автоматически запускаются .sql, .bash скрипты и т.д. В него можно скопировать содержимое дампа и дамп будет развернут
  - ```Dockerfile.yml``` - файл, на основе которого собирается docker-образ
  - ```docker-compose.yml``` - файл, предназначенный для развертывания контейнера с приложением и сервисов из ранее созданного образа
  - ```./project/.env (далее .env)``` - файл с переменными окружения
  - ```.flake8``` - конфиг линтера ```flake8```

## Инструкция для работы с проектом:
  1. Склонировать репозиторий
  2. Активировать окружение poetry: ```poetry shell```
  3. Установить зависимости из файлов poetry: ```poetry install```

## Инструкция для развертывания сайта из docker-образа:
  1. Склонировать репозиторий
  2. Задать выбранное имя БД в файле .env (переменная ```DB_NAME```) и docker-compose (переменная ```POSTGRES_DB```)
  3. Развернуть приложение из корневой папки: ```docker-compose up --build -d``` или ```docker-compose up -d```
  4. Приложение доступно [по адресу](http://localhost:8000/)

## Примечания:
  * Миграции не нужны, т.к. в репозитории лежит дамп БД, в нем уже есть все таблицы с данными и системные таблицы Django
  * Если нужно поменять имя контейнера PostgreSQL в docker-compose, то также нужно не забыть записать его в переменную ```HOST``` в .env
  * Конфиг ```nginx.conf``` должен лежать в директории ```/etc/nginx```
  * Конфиг ```appconfig.conf``` должен лежать в директории ```/etc/nginx/conf.d```
  * Запуск celery (из папки project): ```celery -A project worker -l info -P solo```

