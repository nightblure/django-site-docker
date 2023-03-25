#!/bin/sh

cd ./src
poetry run celery -A project worker -l info -P solo