wait-db:
	@echo "Waiting for database at db:5432..."
	@node -e "
		const net = require('net');
		const wait = () => {
			const s = net.connect(5432, 'db', () => {
				console.log('Database ready!');
				process.exit(0);
			});
			s.on('error', () => {
				process.stdout.write('.');
				setTimeout(wait, 2000);
			});
		};
		wait();
	"

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
