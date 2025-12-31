variable "env_prefix" {
  description = "Environment prefix (e.g. dev, prod)"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for EC2"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "public_key" {
  description = "Path to public SSH key"
  type        = string
}

variable "script_path" {
  description = "Path to user-data script"
  type        = string
}

variable "instance_suffix" {
  description = "Unique suffix for instance resources"
  type        = string
}

variable "common_tags" {
  description = "Common tags for resources"
  type        = map(string)
}
