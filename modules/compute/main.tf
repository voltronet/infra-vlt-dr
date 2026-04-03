resource "aws_security_group" "app_sg" {
  name   = "drcarmen-sg-${var.env}"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_spot_instance_request" "server" {
  count                = (!var.deploy_ecs || var.keep_ec2_during_migration) ? 1 : 0
  ami                  = "ami-0faab6bdbac9486fb"
  instance_type        = var.instance_type
  spot_price           = "0.05"
  subnet_id            = var.subnet_id
  key_name             = var.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  root_block_device {
    volume_size = 250
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y docker.io docker-compose
              systemctl start docker
              EOF
}

# ECS Cluster (Ready but conditional)
resource "aws_ecs_cluster" "main" {
  count = var.deploy_ecs ? 1 : 0
  name  = "drcarmen-cluster-${var.env}"
}