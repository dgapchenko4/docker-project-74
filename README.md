# Docker Project 74

[![CI/CD Pipeline](https://github.com/dgapchenko4/docker-project-74/actions/workflows/push.yml/badge.svg)](https://github.com/dgapchenko4/docker-project-74/actions/workflows/push.yml)

## Требования к системе

- Docker (версия 20.10+)
- Docker Compose (версия 2.0+)
- Git

## Docker Hub образ

Образ доступен на Docker Hub: [dgapchenko4/docker-project-74](https://hub.docker.com/r/dgapchenko4/docker-project-74)

```bash
docker pull dgapchenko4/docker-project-74:latest
docker run -p 8080:8080 dgapchenko4/docker-project-74:latest make start

Команды Makefile
Команда	Описание
make setup	Установка зависимостей
make test	Запуск тестов
make ci	Запуск тестов (для CI)
make dev	Запуск в режиме разработки
make down	Остановка контейнеров
make build	Сборка production образа
make push	Загрузка образа на Docker Hub
Запуск проекта
Разработка
bash

make dev
# Открыть http://localhost:8080

Тестирование
bash

make test

Production
bash

make build
docker run -p 8080:8080 dgapchenko4/docker-project-74:latest make start

Структура проекта
text

.
├── .github/workflows/push.yml   # CI/CD конфигурация
├── app/                          # Исходный код приложения
├── Dockerfile                    # Для разработки
├── Dockerfile.production         # Для production сборки
├── docker-compose.yml            # Production конфигурация
├── docker-compose.override.yml   # Development конфигурация
├── .dockerignore                 # Исключения для Docker
├── .gitignore                    # Исключения для Git
└── Makefile                      # Управление проектом

Переменные окружения

Приложение конфигурируется через переменные окружения:

    NODE_ENV - окружение (development/production)

    DATABASE_HOST - хост PostgreSQL

    DATABASE_PORT - порт PostgreSQL

    DATABASE_NAME - имя базы данных

    DATABASE_USERNAME - пользователь БД

    DATABASE_PASSWORD - пароль БД
    EOF
