HEAD
# Identity-First Cloud Network (Terraform) + Observability

This project builds an identity-first networking pattern on Google Cloud using Terraform, then validates telemetry (logs) from a 
private VM and sets up alerting.

## What this demonstrates
- Private VM access via IAP (no public IP required)
- IAM-first approach (least privilege)
- Centralized logging (Cloud Logging)
- Log-based metric + alerting (Cloud Monitoring)

## Architecture (high level)
- VPC + subnets (private workload subnet)
- Private VM (no public IP)
- IAP TCP forwarding to SSH into the VM
- Cloud Logging ingests syslog/app logs from the VM
- Log-based metric counts matching events (STEP3_TEST)
- Cloud Monitoring alert notifies when threshold is met

## Validation evidence
- Logs appear in Cloud Logging under `jsonPayload.message`
- Filter used: see `observability/log-filter.txt`
- Metric created: `step3_test_count` (log-based metric)
- Alert policy created: `TEST ALERT`

## Repo structure
- `terraform/` - Terraform IaC
- `architecture/` - architecture diagrams and write-ups
- `observability/` - log filter, metric + alert notes
- `screenshots/` - screenshots as proof/evidence

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

```text
private_subnet = "private-subnet"
public_subnet  = "public-subnet"
vpc_name       = "identity-net"

20fe283286e4ab6e9d2d3e366b3e12a72a314e06
