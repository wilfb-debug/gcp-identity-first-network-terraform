terraform {
  backend "gcs" {
    bucket = "tf-state-gcp-identity-network-wb"
    prefix = "gcp-identity-network/terraform.tfstate"
  }
}
