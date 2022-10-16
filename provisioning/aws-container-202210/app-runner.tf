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
      # If you don't specify image_configuration, AWS will apply image_configuration.port = 8080,
      # and you'll occur a change the next time you'll plan and apply.
      image_configuration {
        runtime_environment_variables = { /* empty */ }
      }
      image_identifier      = "public.ecr.aws/aws-containers/hello-app-runner:latest"
      image_repository_type = "ECR_PUBLIC"
    }
  }
}
