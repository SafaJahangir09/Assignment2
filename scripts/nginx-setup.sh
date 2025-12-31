#!/bin/bash
yum update -y
yum install -y nginx openssl
systemctl start nginx
systemctl enable nginx

# Create SSL
mkdir -p /etc/ssl/private /etc/ssl/certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/selfsigned.key \
  -out /etc/ssl/certs/selfsigned.crt \
  -subj "/CN=external-proxy"

# Create the REAL Nginx Config
cat > /etc/nginx/nginx.conf <<EOF
user nginx;
worker_processes auto;
events { worker_connections 1024; }
http {
    upstream my_backend {
        server 10.0.1.42:80;
        server 10.0.1.156:80;
        server 10.0.1.165:80;
    }
    server {
        listen 80;
        return 301 https://\$host\$request_uri;
    }
    server {
        listen 443 ssl;
        ssl_certificate /etc/ssl/certs/selfsigned.crt;
        ssl_certificate_key /etc/ssl/private/selfsigned.key;
        location / {
            proxy_pass http://my_backend;
        }
    }
}
EOF
systemctl restart nginx