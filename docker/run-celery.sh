#!/bin/sh

cd ./project
poetry run celery -A project worker -l info -P solo