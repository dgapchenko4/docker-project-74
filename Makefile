# Автоматическое определение команды Docker Compose
# Проверяем наличие docker-compose (старого) или используем docker compose (новый)
DOCKER_COMPOSE := $(shell docker-compose --version > /dev/null 2>&1 && echo "docker-compose" || echo "docker compose")

# Установка зависимостей
setup:
	$(DOCKER_COMPOSE) run --rm app make setup

# Запуск тестов через Docker Compose
test:
	$(DOCKER_COMPOSE) -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

# CI команда для GitHub Actions
ci:
	$(DOCKER_COMPOSE) -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

# Запуск приложения в режиме разработки
dev:
	$(DOCKER_COMPOSE) up

# Остановка контейнеров
down:
	$(DOCKER_COMPOSE) down

# Полная пересборка с очисткой томов
rebuild:
	$(DOCKER_COMPOSE) down --volumes
	$(DOCKER_COMPOSE) build

# Просмотр логов
logs:
	$(DOCKER_COMPOSE) logs -f

# Статус контейнеров
status:
	$(DOCKER_COMPOSE) ps

# Запуск миграций
migrate:
	$(DOCKER_COMPOSE) exec app npm run migrate

# Вход в контейнер app
shell:
	$(DOCKER_COMPOSE) exec app bash

# Очистка всех ресурсов
clean:
	$(DOCKER_COMPOSE) down -v
	docker system prune -f

# Вывод справки
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