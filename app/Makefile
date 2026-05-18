wait-db:
	@echo "Waiting for database at db:5432..."
	@for i in $$(seq 1 30); do \
		node -e "require('net').connect(5432, 'db').on('error', () => process.exit(1)).on('connect', () => process.exit(0))" 2>/dev/null && echo "Database ready!" && exit 0; \
		echo "Waiting... $$i/30"; \
		sleep 2; \
	done; \
	echo "Database not available"; \
	exit 1

migrate: wait-db
	npm run migrate

setup:
	npm install
	make migrate

test:
	npm test

dev:
	npm run dev

start-backend:
	npm start

start-frontend:
	npx webpack --watch --progress

.PHONY: wait-db migrate setup test dev start-backend start-frontend
