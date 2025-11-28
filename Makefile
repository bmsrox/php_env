include .env

.PHONY: update
update:
		@echo "make update"
		docker compose run --rm web composer update --prefer-dist -o

.PHONY: install
install:
		@echo "make install"
		docker compose run --rm web composer install -o

.PHONY: build
build:
		@echo "make build"
		docker compose run --rm web composer run build

.PHONY: up
up:
		@echo "make up"
		docker compose up -d

.PHONY: down
down:
		@echo "make down"
		docker compose down

.PHONY: logs
logs:
		@echo "make logs"
		docker compose logs -f