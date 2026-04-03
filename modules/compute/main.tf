# Security Group
resource "aws_security_group" "app_sg" {
  vpc_id = var.vpc_id
  ingress { from_port = 22; to_port = 22; protocol = "tcp"; cidr_blocks = ["${var.my_ip}/32"] }
  ingress { from_port = 80; to_port = 80; protocol = "tcp"; cidr_blocks = ["0.0.0.0/0"] }
  egress { from_port = 0; to_port = 0; protocol = "-1"; cidr_blocks = ["0.0.0.0/0"] }
}

# CloudWatch Logs
resource "aws_cloudwatch_log_group" "app_logs" {
  name = "/aws/drcarmen/${var.env}/app"
  retention_in_days = 7
}

# EC2 Spot Instance (Hibrid cu ECS via 'count')
resource "aws_spot_instance_request" "server" {
  count         = (!var.deploy_ecs || var.keep_ec2_during_migration) ? 1 : 0
  ami           = "ami-0faab6bdbac9486fb" # Ubuntu 22.04 eu-central-1
  instance_type = var.instance_type
  spot_price    = "0.05"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.s3_profile.name

  root_block_device {
    volume_size = 250
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update && apt-get install -y docker.io docker-compose
              systemctl start docker
              EOF
}

# ECS Cluster (Condiționat)
resource "aws_ecs_cluster" "main" {
  count = var.deploy_ecs ? 1 : 0
  name  = "drcarmen-cluster-${var.env}"
}

# IAM Role & Profile (pentru S3 și CloudWatch)
resource "aws_iam_role" "s3_role" {
  name = "drcarmen-role-${var.env}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = ["ec2.amazonaws.com", "ecs-tasks.amazonaws.com"] } }]
  })
}

resource "aws_iam_instance_profile" "s3_profile" {
  name = "drcarmen-instance-profile-${var.env}"
  role = aws_iam_role.s3_role.name
}