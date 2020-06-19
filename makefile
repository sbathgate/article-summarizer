default: help

help:  ## Output available commands
	@echo "Available commands:"
	@echo
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

postgres:  ## Access db via psql
	@echo "# \c web_dev"
	@echo "# \dt"
	@docker-compose exec users-db psql -U postgres

rebuild:  ## Rebuild docker images
	@docker-compose up -d --build

test: ## Run the current test suite
	@docker-compose exec web python -m pytest