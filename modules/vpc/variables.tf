variable "env" {
  type        = string
  description = "Numele mediului (ex: test)"
}

variable "az" {
  type        = string
  description = "Availability Zone (ex: eu-central-1a)"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block pentru VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block pentru Subnet-ul Public"
}