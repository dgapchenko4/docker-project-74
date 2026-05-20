wait-db:
	@echo "Waiting for database at db:5432..."
	@node wait-for-db.js

setup:
	docker-compose up -d db
	make wait-db
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

.PHONY: wait-db setup test dev build migrate start-backend start-frontend
