COMPOSE_FILE = docker-compose.yml
CONTAINER_NAME = global-caddy

.PHONY: init up down restart reload status logs shell clean

# Initialize external docker networks if they do not exist
init:
	@docker network inspect movie-network >/dev/null 2>&1 || docker network create movie-network
	@docker network inspect langfuse-network >/dev/null 2>&1 || docker network create langfuse-network
	@docker network inspect mlflow-network >/dev/null 2>&1 || docker network create mlflow-network
	@echo "All external networks are ready."

# Start Caddy gateway
up: init
	docker compose -f $(COMPOSE_FILE) up -d

# Stop Caddy gateway
down:
	docker compose -f $(COMPOSE_FILE) down