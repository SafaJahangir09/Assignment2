📘 Assignment 2 – Multi-Tier Web Infrastructure

Terraform | AWS | Nginx | Apache

📌 Project Overview

This project implements a multi-tier web infrastructure on AWS using Terraform (Infrastructure as Code).
The architecture consists of a public Nginx reverse proxy/load balancer and multiple backend Apache web servers deployed in a secure VPC.

The goal is to demonstrate:

Modular Terraform design

Secure networking

Load balancing using Nginx

Backend scalability

Clean documentation and reproducibility

🏗 Architecture Overview
Text-Based Architecture Diagram
┌─────────────────────────────────────────────────┐
│                  Internet                       │
└─────────────────┬───────────────────────────────┘
                  │
                  │ HTTP (80)
                  ▼
         ┌────────────────────┐
         │   Nginx Server     │
         │  (Load Balancer)   │
         │   - Reverse Proxy  │
         │   - Traffic Routing│
         └────────┬───────────┘
                  │
      ┌───────────┼───────────┐
      │           │           │
      ▼           ▼           ▼
   ┌─────┐     ┌─────┐     ┌─────┐
   │Web-1│     │Web-2│     │Web-3│
   │Apache│    │Apache│    │Apache│
   └─────┘     └─────┘     └─────┘
   Primary     Primary     Backup

🧩 Components Description
1. Networking

Custom VPC

Public subnet for Nginx

Private or controlled subnets for backend servers

Internet Gateway and routing tables

2. Nginx Server (Frontend)

Acts as reverse proxy & load balancer

Receives public HTTP traffic

Forwards requests to backend Apache servers

3. Backend Web Servers

Apache (httpd) running on Amazon Linux

Serve static web content

Multiple instances for redundancy

4. Security Groups

Nginx SG: allows HTTP (80) & SSH (22)

Backend SG: allows HTTP (80) from Nginx / VPC

⚙ Prerequisites
Required Tools

AWS Account

Terraform ≥ 1.x

AWS CLI

Web browser

SSH client (optional)

AWS Credentials Setup

Configure AWS CLI:

aws configure


Provide:

AWS Access Key

AWS Secret Key

Region (e.g. us-east-1)

🔐 SSH Key Setup

Terraform generates or uses a provided public key

Key is attached to EC2 instances

EC2 Instance Connect was used for browser-based access (no local SSH dependency)

🚀 Deployment Instructions
Step-by-Step Guide

Clone / open project directory

Initialize Terraform:

terraform init


Validate configuration:

terraform validate


Review execution plan:

terraform plan


Deploy infrastructure:

terraform apply


Confirm with yes.

Variable Configuration

All configurable values are stored in:

variables.tf

terraform.tfvars

Examples:

Instance types

Number of backend servers

CIDR ranges

Environment prefixes

🔧 Configuration Guide
Updating Backend IPs (Nginx)

Backend servers are defined in the Nginx upstream block:

upstream backend {
    server 10.0.2.10;
    server 10.0.2.11;
}


After changes:

sudo nginx -t
sudo systemctl reload nginx

Nginx Configuration Explanation

upstream backend defines backend pool

proxy_pass forwards client requests

Load balancing is round-robin by default

🧪 Testing Procedures
Backend Test (on backend EC2)
curl localhost


Expected:

Backend Server - Apache Working

Nginx to Backend Test
curl http://<BACKEND_IP>

Browser Test

Open:

http://<NGINX_PUBLIC_IP>


Expected:

Backend page loads via Nginx

🔐 Architecture Details
Network Topology

Internet → Nginx (Public Subnet)

Nginx → Backend Servers (Private/Internal)

Security Groups

Principle of least privilege

Backend accessible only through Nginx

Load Balancing Strategy

Nginx reverse proxy

Multiple backend servers

High availability design

🛠 Troubleshooting
Common Issues & Solutions
Issue	Solution
502 Bad Gateway	Backend not running Apache
Site not reachable	Check security groups
SSH issues	Use EC2 Instance Connect
Redirect loop	Wrong backend IP
Log Locations

Nginx logs:

/var/log/nginx/error.log
/var/log/nginx/access.log


Apache logs:

/var/log/httpd/error_log
/var/log/httpd/access_log

Useful Debug Commands
systemctl status nginx
systemctl status httpd
curl localhost
curl <backend-ip>

📦 Deliverables

Terraform source code

Working AWS infrastructure

Screenshots of deployment

This README documentation
