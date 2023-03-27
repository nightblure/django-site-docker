ARG PY_VER=3.10.10-alpine3.16
FROM python:${PY_VER}

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PROD=True

RUN apk update \
    && apk add --no-cache \
        python3-dev \
        postgresql-dev \
        gcc \
        musl-dev

RUN mkdir /app

# задаем рабочую директорию в контексте Dockerfile. далее можно пользоваться "." и писать относительные пути (относительно директории /app)
WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN pip install --upgrade pip \
    && pip install poetry \
    && poetry install

COPY src src

COPY docker docker

RUN chmod a+x ./docker/*.sh

EXPOSE 80
CMD docker/run-app.sh