output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "public_subnet" {
  value = google_compute_subnetwork.public.name
}

output "private_subnet" {
  value = google_compute_subnetwork.private.name
}
output "terraform_provisioner_sa" {
  value = google_service_account.terraform_provisioner.email
}
