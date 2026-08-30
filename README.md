Markdown
# platform_gateway
Reverse proxy and automatic SSL gateway for the Kurangdoa platform using [Caddy](https://caddyserver.com/docs/quick-starts/caddyfile)

## 🚀 Overview

This repository manages the global reverse proxy gateway routing public traffic to platform services:
* **Movie Trip Planner (`movie-trip.kurangdoa.com`)**: Next.js frontend and FastAPI backend
* **Langfuse (`langfuse.kurangdoa.com`)**: LLM observability and tracing platform
* **MLflow (`mlflow.kurangdoa.com`)**: Experiment tracking server

---

## 🔒 Automated SSL & Zero-Config HTTPS

Unlike traditional Nginx + Certbot setups, Caddy handles TLS automatically:
* **Automatic Certificates**: Caddy requests, verifies, and installs Let's Encrypt certificates on first startup.
* **Auto-Renewal**: Background renewal without cron jobs or external certbot containers.
* **No Startup Crashes**: Caddy boots cleanly even if upstream application containers are temporarily offline.

Previously, Nginx was considered but it was too quirky for the purpose.

---