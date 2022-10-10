module "google-container-202210" {
  source             = "./google-container-202210"
  project_unique_id  = "${var.project_unique_id}-google-container-202210"
  gcp_default_region = var.gcp_default_region
}

output "google-container-202210" {
  value     = module.google-container-202210
  sensitive = true
}
