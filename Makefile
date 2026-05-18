.DEFAULT_GOAL := help

setup:
	docker compose run --rm app make setup

test:
	docker compose up --abort-on-container-exit --exit-code-from app --remove-orphans

ci:
	docker compose up --abort-on-container-exit --exit-code-from app --remove-orphans

dev:
	docker compose up

down:
	docker compose down

rebuild:
	docker compose down --volumes --remove-orphans
	docker compose build --no-cache

logs:
	docker compose logs -f

status:
	docker compose ps

migrate:
	docker compose exec app npm run migrate

shell:
	docker compose exec app bash

clean:
	docker compose down -v --remove-orphans
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