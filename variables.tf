variable "aws_region" {
  default = "me-central-1"
}

variable "project_name" {
  description = "Name for tags"
}

variable "env_prefix" {
  description = "Environment (dev/prod)"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "availability_zone" {}
variable "instance_type" {}
variable "public_key" {}
variable "private_key" {}
variable "key_name" {}