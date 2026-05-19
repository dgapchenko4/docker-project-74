DOCKER_COMPOSE := docker-compose

setup:
	$(DOCKER_COMPOSE) run --rm app make setup

test:
	$(DOCKER_COMPOSE) -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

dev:
	$(DOCKER_COMPOSE) up

down:
	$(DOCKER_COMPOSE) down

.PHONY: setup test dev down

ci:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app
