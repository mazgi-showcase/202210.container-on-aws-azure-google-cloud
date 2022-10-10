output "endpoints" {
  value = {
    main-linux-docker = azurerm_linux_web_app.main-linux-docker.default_hostname,
  }
}
