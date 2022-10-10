output "endpoints" {
  value = {
    main = aws_apprunner_service.main.service_url,
  }
}
