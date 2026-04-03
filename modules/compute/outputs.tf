output "server_public_ip" {
  # Atenție: folosim .public_ip pentru cererea de spot
  value = aws_spot_instance_request.app_server.public_ip
}

output "instance_id" {
  value = aws_spot_instance_request.app_server.spot_instance_id
}

output "deployment_type" {
  value = var.deploy_ecs ? "ECS Fargate" : "EC2 Spot"
}