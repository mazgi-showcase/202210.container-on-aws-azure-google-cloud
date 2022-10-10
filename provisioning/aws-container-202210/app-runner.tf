resource "random_string" "main-service-name" {
  length  = 16
  special = false
  upper   = false
}

resource "aws_apprunner_service" "main" {
  service_name = random_string.main-service-name.result
  source_configuration {
    # App Runner doesn't support automatic deployments for an image in an ECR Public repository.
    auto_deployments_enabled = false
    image_repository {
      image_configuration {
        runtime_environment_variables = {}
      }
      image_identifier      = "public.ecr.aws/aws-containers/hello-app-runner:latest"
      image_repository_type = "ECR_PUBLIC"
    }
  }
}
