CREATE DATABASE monitoring;

CREATE TABLE alert_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50),
    alert_name VARCHAR(100),
    instance VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);