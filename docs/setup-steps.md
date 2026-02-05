# Setup Ubuntu Server + Nginx + Prometheus + Grafana + n8n + MariaDB

Panduan ini digunakan untuk setup **Ubuntu Server di VMware** lengkap dengan monitoring dan automation stack.

---

## 1. Install Ubuntu Server
Install Ubuntu Server (20.04 / 22.04) di VMware.

Update sistem:
```bash
sudo apt update && sudo apt upgrade -y
```

Install tools dasar:
```bash
sudo apt install -y curl wget unzip net-tools
```

## 2. Install Nginx

```bash
sudo apt install -y nginx
```

Enable & start:
```bash
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx
```

Cek via browser:
```bash
http://IP_SERVER
```

## 3. Install Node Exporter

Download & Install:
```bash
cd /tmp
wget https://github.com/prometheus/node_exporter/releases/latest/download/node_exporter-1.7.0.linux-amd64.tar.gz
tar xvf node_exporter-*.tar.gz
sudo mv node_exporter-*/node_exporter /usr/local/bin/
```

Service Node Exporter:
```bash
sudo nano /etc/systemd/system/node_exporter.service
```
```bash
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=nobody
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```

Enable & start:
```bash
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
```

Cek:
```bash
curl http://localhost:9100/metrics
```

## 4. Install Prometheus

Download Prometheus:
```bash
cd /tmp
wget https://github.com/prometheus/prometheus/releases/latest/download/prometheus-2.50.1.linux-amd64.tar.gz
tar xvf prometheus-*.tar.gz
sudo mv prometheus-* /opt/prometheus
```

Buat User Prometheus:
```bash
sudo useradd --no-create-home --shell /bin/false prometheus
sudo chown -R prometheus:prometheus /opt/prometheus
```

Konfigurasi Prometheus:
```bash
sudo nano /opt/prometheus/prometheus.yml
```
```bash
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'node_exporter'
    static_configs:
      - targets: ['localhost:9100']
```

Service Prometheus:
```bash
sudo nano /etc/systemd/system/prometheus.service
```
```bash
[Unit]
Description=Prometheus
After=network.target

[Service]
User=prometheus
ExecStart=/opt/prometheus/prometheus \
  --config.file=/opt/prometheus/prometheus.yml

[Install]
WantedBy=multi-user.target
```

Enable & start:
```bash
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus
```

Akses:
```bash
http://IP_SERVER:9090
```

## 5. Install Grafana

Tambahkan Repository Grafana:
```bash
sudo apt install -y software-properties-common
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
```

Install Grafana:
```bash
sudo apt update
sudo apt install -y grafana
```

Enable & start:
```bash
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
```

Akses:
```bash
http://IP_SERVER:3000
```

Login default:
```bash
username: admin
password: admin
```

Tambahkan Data Source:
```bash
Type: Prometheus
URL : http://localhost:9090
```

## 6. Setup MariaDB

Install MariaDB:
```bash
sudo apt install -y mariadb-server
```

Secure Installation:
```bash
sudo mysql_secure_installation
```

Buat Database untuk n8n:
```bash
sudo mysql -u root -p
```