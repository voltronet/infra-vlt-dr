---
name: terraform-instructions
description: '**FILE INSTRUCTION** — Guidance for Terraform infrastructure and GitHub Actions deployment files in the drcarmen repo. USE FOR: editing `.tf`, `.tfvars`, and `.github/workflows/*.yml` files. DO NOT USE FOR: general application code or unrelated docs.'
applyTo:
  - 'environments/**/*.tf'
  - '**/*.tfvars'
  - '.github/workflows/**/*.yml'
---

# Terraform Instructions

## Use When

- updating Terraform configuration in `environments/test`
- changing Terraform variables for the drcarmen deployment
- modifying GitHub Actions workflow logic that runs `terraform init`, `plan`, or `apply`

## Key Guidance

- Keep AWS credentials and deployment secrets out of source control. Use GitHub Actions secrets such as `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `TF_VAR_my_ip_address`, and `TF_VAR_ssh_key_name`.
- Use the repo's Terraform working directory pattern: `terraform -chdir=environments/test ...`.
- Prefer `terraform plan -no-color` for CI plan validation and use explicit apply steps only when ready.
- Ensure `AWS_REGION` is consistent across Terraform provider configuration and GitHub Actions environment settings.
- Avoid hard-coding IP addresses, SSH key names, or credentials in `.tf` files; model them as variables.
- Validate workflow YAML syntax and secrets references whenever you change `.github/workflows/deploy-infra.yml`.

## Best Practices

- Keep resource definitions simple and explicit in `main.tf`.
- Use variables and locals for values that differ between environments.
- Do not commit generated state files or credentials.
- If adding new Terraform files, keep them inside `environments/test` or a clearly isolated environment folder.
