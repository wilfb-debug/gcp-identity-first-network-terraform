# Identity-First Cloud Architecture with Terraform (GCP)

This project demonstrates designing and deploying a secure, identity-first cloud architecture on Google Cloud Platform using Terraform.

## Key Concepts
- Identity-first access using IAM and service accounts
- Private networking using VPCs and firewall rules
- Infrastructure as Code with Terraform
- Secure service-to-service communication

## Architecture Principles

- No public access by default
- Least-privilege IAM
- Network segmentation
- Repeatable infrastructure via Terraform

## Identity Model

This project separates identities by responsibility:

- Human identity: used for administrative setup only
- Terraform service account: used to provision infrastructure via Infrastructure as Code
- Runtime service account: used by workloads to access dependent services

This separation enforces least privilege and reduces blast radius.

## Terraform outputs (post-Apply)
- private_subnet = "private-subnet"
- public_subnet = "public-subnet"
- vpc_name = "identity-net"
