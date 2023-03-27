deps:
	pip install --upgrade pip
	poetry shell
	poetry install

server:
	cd src && python manage.py runserver

celery:
	cd src && celery -A project worker -l info -P solo

linter:
	flake8 src

tests:
	cd src
	pytest -rs -n auto --ff -x --create-db --cov-report=html --cov=. -m 'not single_thread'

up:
	docker-compose up --build -d