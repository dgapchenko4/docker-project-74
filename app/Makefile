setup:
	docker-compose up -d db
	@echo "Waiting for database..."
	@for i in $$(seq 1 30); do \
		docker-compose exec db pg_isready -U postgres 2>/dev/null && break; \
		echo "Waiting... $$i/30"; \
		sleep 2; \
	done
	npm install
	npm run migrate

test:
	npm test

dev:
	npm run dev

build:
	npm run build

migrate:
	npm run migrate

start-backend:
	npm start

start-frontend:
	npx webpack --watch --progress

.PHONY: setup test dev build migrate start-backend start-frontend
