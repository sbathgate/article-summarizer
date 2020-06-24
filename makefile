default: build

build: ## Build the docker containers
	docker-compose build
	rebuild-db
	test

help:  ## Output available commands
	@echo "Available commands:"
	@echo
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

lint-check:  ## Conduct lint checks
	@docker-compose exec web flake8 .
	@echo "flake8 complete!"
	@docker-compose exec web black . --check
	@echo "black complete!"
	@docker-compose exec web /bin/sh -c "isort ./**/*.py --check-only"
	@echo "isort complete!"

lint-correct:  ## Correct lint issues
	@docker-compose exec web flake8 .
	@echo "flake8 complete!"
	@docker-compose exec web black .
	@echo "black complete!"
	@docker-compose exec web /bin/sh -c "isort ./**/*.py"
	@echo "isort complete!"

lint-diff:  ## Display differences in lint
	@docker-compose exec web flake8 .
	@echo "flake8 complete!"
	@docker-compose exec web black . --diff
	@echo "black complete!"
	@docker-compose exec web /bin/sh -c "isort ./**/*.py --diff"
	@echo "isort complete!"

postgres:  ## Access db via psql
	@echo "# \c web_dev"
	@echo "# \dt"
	@docker-compose exec users-db psql -U postgres

rebuild:  ## Rebuild docker images
	@docker-compose up -d --build

rebuild-db:  ## Rebuild db in docker image
	@docker-compose exec web python app/db.py

start:  # Start docker containers
	@docker-compose up -d

test: ## Run the current test suite
	@docker-compose exec web python -m pytest --cov="."

test-routes:  ## Test routes using HTTPie 
	@echo "Get all: http GET <HOST_URL>/summaries/"
	@echo "Get one: http GET <HOST_URL>/summaries/<id>"
	@echo "Add Summary: http --json POST <HOST_URL>/summaries/ url=https://shaunb.ca"
	@echo "Change Summary: http --json PUT <HOST_URL>/summaries/ url=https://shaunb.ca summary=super"
	@echo "Get one: http DELETE <HOST_URL>/summaries/<id>"