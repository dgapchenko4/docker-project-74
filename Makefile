# Установка зависимостей
setup:
	docker-compose run --rm app make setup

# Запуск тестов через Docker Compose
test:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

# CI команда для GitHub Actions
ci:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

# Запуск приложения в режиме разработки
dev:
	docker-compose up

# Остановка контейнеров
down:
	docker-compose down

# Полная пересборка
rebuild:
	docker-compose down --volumes
	docker-compose build
