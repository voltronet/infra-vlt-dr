output "IP_SERVER_DR_CARMEN" {
  description = "IP-ul public pentru acces direct"
  value       = module.compute.server_public_ip
}

output "COMANDA_SSH" {
  description = "Comanda rapida pentru logare"
  value       = "ssh -i ${var.ssh_key_name}.pem ubuntu@${module.compute.server_public_ip}"
}

output "DETALII_SERVER_DR_CARMEN" {
  description = "Informatii necesare pentru accesarea infrastructurii"
  value = {
    IP_Public_EC2     = module.compute.server_public_ip
    ID_Instanta       = module.compute.instance_id
    Nume_Bucket_S3    = module.storage.bucket_name
    VPC_ID            = module.vpc.vpc_id
    Comanda_Logare_SSH = "ssh -i ${var.ssh_key_name}.pem ubuntu@${module.compute.server_public_ip}"
  }
}

output "PASI_URMATORI" {
  value = "Copiaza IP-ul de mai sus si adauga-l manual in panoul tau de DNS (GoDaddy/Hostico/etc.) pentru domeniul drcarmen.ro"
}