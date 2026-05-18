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

# ... остальные цели