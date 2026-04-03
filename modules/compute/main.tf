resource "aws_spot_instance_request" "app_server" {
  ami           = "ami-0084a47cc718c111a" # Ubuntu 22.04 in eu-central-1
  instance_type = var.instance_type
  spot_price    = "0.05"
  wait_for_fulfillment = true

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "drcarmen-server-${var.env}"
  }
}

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