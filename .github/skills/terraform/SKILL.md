---
name: terraform
description: '**WORKFLOW SKILL** — Automate Terraform infrastructure deployment for the drcarmen project. USE FOR: deploying infra with init, plan, apply steps; managing Terraform workflows in CI/CD. DO NOT USE FOR: general Terraform questions; manual edits. INVOKES: terminal tools for terraform commands, file system tools for config.'
---

# Terraform Deployment Skill

## Overview

This skill automates the Terraform deployment process for the drcarmen project, including initialization, planning, and applying changes.

## Usage

To use this skill, invoke it when you need to deploy infrastructure changes. It will handle the standard Terraform workflow in the `environments/test` directory.

## Workflow Steps

1. **Initialize Terraform**: Run `terraform init` in the target directory.
2. **Plan Changes**: Run `terraform plan` to preview changes.
3. **Apply Changes**: Run `terraform apply` with confirmation.

## Prerequisites

- AWS credentials configured as secrets.
- Terraform installed.
- Target directory: `environments/test`

## Assets

This skill may include bundled scripts or templates for common Terraform operations.