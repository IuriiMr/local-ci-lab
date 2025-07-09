PROJECT_NAME = local-ci-lab
COMPOSE = docker compose
CONFIG_DIR = ./config/runner

.PHONY: all up down restart logs runner-clean reset

all: up

up:
	@echo "🚀 Starting $(PROJECT_NAME)..."
	$(COMPOSE) up -d

down:
	@echo "🛑 Stopping $(PROJECT_NAME)..."
	$(COMPOSE) down

restart:
	@echo "🔁 Restarting $(PROJECT_NAME)..."
	$(COMPOSE) down
	$(COMPOSE) up -d

logs:
	@echo "📜 Showing logs..."
	$(COMPOSE) logs -f

runner-clean:
	@echo "🧹 Cleaning runner config..."
	rm -rf $(CONFIG_DIR)

reset: down runner-clean
	@echo "🧼 Full reset completed. Run 'make up' to start fresh."

