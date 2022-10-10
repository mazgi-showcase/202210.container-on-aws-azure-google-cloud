module "azure-container-202210" {
  source                 = "./azure-container-202210"
  project_unique_id      = "${var.project_unique_id}-azure-container-202210"
  azure_default_location = var.azure_default_location
}

output "azure-container-202210" {
  value     = module.azure-container-202210
  sensitive = true
}
