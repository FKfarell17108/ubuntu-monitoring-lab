# Ubuntu Monitoring & Automation Lab

**Lab monitoring server** yang dibuat untuk memantau infrastruktur dan otomatisasi alert menggunakan Prometheus, Grafana, n8n, dan MariaDB.

![ubuntulab](docs/images/grafana-monitoring.png)

---

## Tujuan

- Memantau status server
- Mencatat event alert ke database
- Mengirim alert otomatis ke Telegram
- Menyediakan dashboard monitoring yang interaktif

---

## Stack

- **Ubuntu Server**
- **Nginx**
- **Prometheus** – untuk monitoring metrics
- **Grafana** – untuk visualisasi dashboard
- **n8n** – workflow automation alert
- **MariaDB** – menyimpan log alert
- **Docker / Docker Desktop** – containerization

---

## Arsitektur

1. **Prometheus** mengambil metrics dari Node Exporter
2. Ketika deteksi server down/detected event → **n8n** memproses
3. n8n kemudian meneruskan alert ke:
   - **Telegram**
   - **Database MariaDB (log alert)**

![ubuntulab](docs/images/arsitektur.png)

---

## Fitur Utama

- Dashboard monitoring server
- Alert otomatis ke Telegram
- Logging alert ke database
- Monitoring dummy web service

---

## Prasyarat

- Docker & Docker Compose
- Ubuntu Server
- Telegram Bot Token + Chat ID untuk alert

---

## Instalasi & Setup

1. **Clone repo**
```bash
git clone https://github.com/FKfarell17108/ubuntu-monitoring-lab.git
cd ubuntu-monitoring-lab
```
   
2. **Jalankan Docker Compose**
```bash
docker compose up -d
```

---

## Alur Kerja

Server down → Prometheus → n8n → Telegram + Database log

![ubuntulab](docs/images/workflow.png)

---

## Sumber Resmi Rilis Software

- **Node Exporter Releases**  
  [https://github.com/prometheus/node_exporter/releases](https://github.com/prometheus/node_exporter/releases)  
  Halaman rilis resmi Node Exporter untuk download binary atau source code terbaru.

- **Prometheus Releases**  
  [https://github.com/prometheus/prometheus/releases/](https://github.com/prometheus/prometheus/releases/)  
  Halaman rilis resmi Prometheus untuk download binary atau source code terbaru.

---

## © 2026 Farell Kurniawan

Hak cipta © 2026 Farell Kurniawan. Semua hak dilindungi undang-undang.  
Distribusi dan penggunaan kode ini diizinkan sesuai dengan ketentuan lisensi **MIT**.


