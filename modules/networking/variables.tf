variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "project_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
