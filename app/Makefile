setup:
	cd /project/code && docker-compose up -d db
	@echo "Waiting for database..."
	@for i in $$(seq 1 30); do \
		cd /project/code && docker-compose exec db pg_isready -U postgres 2>/dev/null && break; \
		echo "Waiting... $$i/30"; \
		sleep 2; \
	done
	cd /project/code && docker-compose run --rm app npm run migrate

test:
	cd /project/code && docker-compose run --rm app npm test

dev:
	cd /project/code && docker-compose up

start-backend:
	cd /project/code && docker-compose run --rm app npm start

start-frontend:
	cd /project/code && docker-compose run --rm app npx webpack --watch --progress

build:
	cd /project/code && docker-compose run --rm app npm run build

migrate:
	cd /project/code && docker-compose run --rm app npm run migrate

.PHONY: setup test dev start-backend start-frontend build migrate