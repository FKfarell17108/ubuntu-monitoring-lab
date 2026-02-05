# System Architecture

Workflow monitoring:

Ubuntu Server
    ↓
Node Exporter
    ↓
Prometheus
    ↓
Grafana Dashboard

Alert Flow:

Prometheus Alert
    ↓
n8n Webhook
    ↓
Telegram Notification
    ↓
MariaDB Log Storage