variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "bucket_arn" {
  type = string
}

variable "my_ip" {
  type = string
}

variable "key_name" {
  type = string
}

variable "deploy_ecs" {
  type    = bool
  default = false
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "keep_ec2_during_migration" {
  type    = bool
  default = false
}