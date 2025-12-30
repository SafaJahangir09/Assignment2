variable "vpc_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "web_ports" {
  type = list(number)
}
