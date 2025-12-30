# AWS region
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "me-central-1"
}

# Project name
variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "assignment2"
}

# VPC CIDR
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Public subnet CIDRs
variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

# Instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# Key pair name
variable "key_name" {
  description = "SSH key pair name"
  type        = string
}
