module "aws-container-202210" {
  source             = "./aws-container-202210"
  project_unique_id  = "${var.project_unique_id}-aws-container-202210"
  aws_default_region = var.aws_default_region
}

output "aws-container-202210" {
  value     = module.aws-container-202210
  sensitive = true
}
