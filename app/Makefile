# Запуск базы данных
db-up:
	docker compose up -d db

# Ожидание готовности базы данных
wait-db: db-up
	@echo "Waiting for database at db:5432..."
	@for i in $$(seq 1 30); do \
		docker compose exec db pg_isready -U postgres 2>/dev/null && echo "Database ready!" && exit 0; \
		echo "Waiting... $$i/30"; \
		sleep 2; \
	done; \
	echo "Database not available"; \
	exit 1

# Миграции с ожиданием базы
migrate: wait-db
	npm run migrate

# Основная установка
setup:
	npm install
	make migrate

# Запуск тестов
test:
	npm test

# Остальные цели
dev:
	npm run dev

start-backend:
	npm start

start-frontend:
	npx webpack --watch --progress

build:
	npm run build

.PHONY: db-up wait-db migrate setup test dev start-backend start-frontend build
