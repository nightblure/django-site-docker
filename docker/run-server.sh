#!/bin/sh

cd ./src
poetry run gunicorn -b 0.0.0.0:8000 project.wsgi:application