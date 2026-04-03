# Date AWS
my_ip_address      = "81.196.200.55"        # IP-ul tău de acasă (vezi pe ipchicken.com)
ssh_key_name       = "airimus-key"          # Numele exact al cheii din consola AWS (fără .pem)

# Date Cloudflare
cloudflare_token   = "T0k3n_G3n3r4t_D1n_CF" # Cel pe care l-am generat adineauri
cloudflare_zone_id = "ID_Zonă_Domeniu"      # ID-ul de pe prima pagină a domeniului în CF

# Switch-uri de Infrastructură
deploy_ecs                = false           # Rămânem pe EC2 Spot (Ieftin)
keep_ec2_during_migration = false           # Folosim true doar când facem switch-ul la ECS