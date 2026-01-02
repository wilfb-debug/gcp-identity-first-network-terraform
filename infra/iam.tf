############################################
# Task B: IAM (Identity Separation)
############################################

# Terraform provisioning identity (separate from your human user)
resource "google_service_account" "terraform_provisioner" {
  account_id   = "terraform-provisioner"
  display_name = "Terraform Provisioner (IaC)"
}

# Allow your human identity to impersonate the Terraform SA
# (Replace the email below if yours is different)
resource "google_service_account_iam_member" "allow_impersonation" {
  service_account_id = google_service_account.terraform_provisioner.name
  role               = "roles/iam.serviceAccountTokenCreator"
  member             = "user:wilfarch2026@gmail.com"
}

# Least privilege roles for provisioning THIS project
resource "google_project_iam_member" "tf_compute_network_admin" {
  project = var.project_id
  role    = "roles/compute.networkAdmin"
  member  = "serviceAccount:${google_service_account.terraform_provisioner.email}"
}

resource "google_project_iam_member" "tf_compute_security_admin" {
  project = var.project_id
  role    = "roles/compute.securityAdmin"
  member  = "serviceAccount:${google_service_account.terraform_provisioner.email}"
}

resource "google_project_iam_member" "tf_storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.terraform_provisioner.email}"
}
