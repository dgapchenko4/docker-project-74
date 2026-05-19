# Используем docker compose (без дефиса) - современный плагин
DOCKER_COMPOSE := docker compose

# Установка зависимостей
setup:
	$(DOCKER_COMPOSE) run --rm app make setup

# Запуск тестов через Docker Compose
test:
	$(DOCKER_COMPOSE) up --abort-on-container-exit --exit-code-from app

# CI команда для GitHub Actions
ci:
	$(DOCKER_COMPOSE) -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

# Запуск приложения в режиме разработки
dev:
	$(DOCKER_COMPOSE) up

# Остановка контейнеров
down:
	$(DOCKER_COMPOSE) down

# Остальные команды...
.PHONY: setup test ci dev down
