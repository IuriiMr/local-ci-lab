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

fix-nginx-perms:
	@echo "🔧 Creating nginx writable temp dirs..."
	mkdir -p ./nginx/client_body_temp \
	         ./nginx/proxy_temp \
	         ./nginx/fastcgi_temp \
	         ./nginx/uwsgi_temp \
	         ./nginx/scgi_temp \
	         ./nginx/var_run \
	         ./nginx/portal_var_run
	chmod -R 777 ./nginx
	@echo "✅ Done: All nginx temp dirs created and permissions set."

