# Assignment 2 – Multi-Tier Web Infrastructure

### Project Overview
This project demonstrates the deployment of a multi-tier web infrastructure on AWS using Terraform.
The architecture includes a public Nginx server acting as a reverse proxy and load balancer, forwarding traffic to multiple backend Apache web servers.

### Architecture Overview

Internet
   |
 HTTP (80)
   |
Nginx Server (Load Balancer / Reverse Proxy)
   |
---------------------------------
|               |               |
Web-1           Web-2           Web-3
Apache          Apache          Apache
Primary         Primary         Backup

### Components Description

1. Networking
- Custom VPC
- Public subnet for Nginx
- Controlled subnets for backend servers
- Internet Gateway and routing tables

2. Nginx Server (Frontend)
- Reverse proxy
- Load balancer
- Receives HTTP traffic on port 80
- Routes traffic to backend Apache servers

3. Backend Web Servers
- Apache (httpd) on Amazon Linux
- Serve static content
- Multiple instances for redundancy

4. Security Groups
- Nginx SG: Allow HTTP (80) and SSH (22)
- Backend SG: Allow HTTP (80) from Nginx only

Prerequisites
- AWS Account
- Terraform installed
- SSH key pair
- Git

Required Tools
- Terraform
- AWS CLI
- SSH Client
- Git

AWS Credentials Setup
Configure AWS CLI using:
aws configure

SSH Key Setup
Create or use an existing EC2 key pair.
Place the .pem file in a secure directory.

### Deployment Instructions
1. Clone the repository
2. Configure variables.tf
3. Initialize Terraform
   terraform init
4. Validate configuration
   terraform validate
5. Apply infrastructure
   terraform apply

Configuration Guide
- Backend IPs are updated in Nginx upstream block
- Nginx configuration located in /etc/nginx/nginx.conf

Testing Procedures
- Access Nginx public IP in browser
- Verify load balancing using refresh
- Test backend servers directly

Architecture Details
- Public-facing Nginx
- Private backend servers
- Controlled inbound and outbound rules

Troubleshooting
Common Issues:
- 502 Bad Gateway: Backend not reachable
- Connection timeout: Security Group or subnet issue

Log Locations
- Nginx: /var/log/nginx/error.log
- Apache: /var/log/httpd/error_log

### Debug Commands
- sudo nginx -t
- sudo systemctl status nginx
- sudo systemctl status httpd
- curl http://localhost
