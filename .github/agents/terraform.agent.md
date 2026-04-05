---
name: terraform
description: '**CUSTOM AGENT** — Focused on Terraform infrastructure and deployment automation for the drcarmen repo. USE FOR: editing Terraform configuration, GitHub Actions deploy workflow, and repo-specific infrastructure changes. DO NOT USE FOR: application code, non-infra documentation, or unrelated automation tasks.'
applyTo:
  - 'environments/**/*.tf'
  - '**/*.tfvars'
  - '.github/workflows/**/*.yml'
  - 'terraform.tfstate'
  - '*.tf'
---

# Terraform Agent

## Purpose

This custom agent is tuned for the `infra-vlt-dr` repository and is intended to help with Terraform configuration, deployment workflows, and infrastructure automation for the drcarmen project.

## When to Use

- editing `environments/test/main.tf` or other Terraform resource files
- updating GitHub Actions workflows that deploy infrastructure
- reviewing Terraform variables and secret usage
- validating deployment steps and environment configuration

## Scope

- Terraform files under `environments/`
- Terraform variable files (`*.tfvars`)
- GitHub Actions workflow files in `.github/workflows`
- repo-specific infra deployment patterns and best practices
