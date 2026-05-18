# Запуск базы данных перед миграциями
setup:
	docker-compose -f ../docker-compose.yml -f ../docker-compose.override.yml up -d db
	@echo "Waiting for database..."
	@for i in $$(seq 1 30); do \
		docker-compose exec db pg_isready -U postgres 2>/dev/null && break; \
		echo "Waiting... $$i/30"; \
		sleep 2; \
	done
	npm install
	npm run migrate

# Остальные цели
test:
	npm test

dev:
	npm run dev

start-backend:
	npm start

start-frontend:
	npx webpack --watch --progress

build:
	npm run build

migrate:
	npm run migrate

.PHONY: setup test dev start-backend start-frontend build migrate