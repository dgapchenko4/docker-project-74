# Используем docker-compose (с дефисом)
DOCKER_COMPOSE := docker-compose

setup:
	$(DOCKER_COMPOSE) run --rm app make setup

test:
	$(DOCKER_COMPOSE) -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

ci:
	$(DOCKER_COMPOSE) -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

dev:
	$(DOCKER_COMPOSE) up

down:
	$(DOCKER_COMPOSE) down

rebuild:
	$(DOCKER_COMPOSE) down --volumes --remove-orphans
	$(DOCKER_COMPOSE) build --no-cache

logs:
	$(DOCKER_COMPOSE) logs -f

status:
	$(DOCKER_COMPOSE) ps

migrate:
	$(DOCKER_COMPOSE) exec app npm run migrate

shell:
	$(DOCKER_COMPOSE) exec app bash

clean:
	$(DOCKER_COMPOSE) down -v --remove-orphans
	docker system prune -f

help:
	@echo "Доступные команды:"
	@echo "  make setup    - установка зависимостей"
	@echo "  make test     - запуск тестов"
	@echo "  make ci       - запуск тестов (для CI)"
	@echo "  make dev      - запуск приложения в режиме разработки"
	@echo "  make down     - остановка контейнеров"
	@echo "  make rebuild  - полная пересборка"
	@echo "  make logs     - просмотр логов"
	@echo "  make status   - статус контейнеров"
	@echo "  make migrate  - запуск миграций"
	@echo "  make shell    - вход в контейнер app"
	@echo "  make clean    - полная очистка"

.PHONY: setup test ci dev down rebuild logs status migrate shell clean help
