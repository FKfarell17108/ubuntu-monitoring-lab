# Ubuntu Monitoring & Automation Lab

Project lab monitoring server menggunakan:
- Ubuntu Server
- Prometheus
- Grafana
- n8n automation
- MariaDB logging
- Telegram alert

## Architecture
Monitoring server menggunakan Prometheus dan Node Exporter.
Alert dikirim ke n8n lalu diteruskan ke Telegram dan database.

## Features
- Server monitoring dashboard
- Telegram alert automation
- Logging alert ke database
- Dummy web service monitoring

## Stack
- Ubuntu Server 22.04
- Nginx
- Prometheus
- Grafana
- n8n
- MariaDB
- Docker Desktop

## Workflow
Server down → Prometheus → n8n → Telegram + DB log

## Setup Steps
Lihat folder `/docs/setup-steps.md`

## Support:
- https://github.com/prometheus/node_exporter/releases
- https://github.com/prometheus/prometheus/releases/

## Author
Farell Kurniawan