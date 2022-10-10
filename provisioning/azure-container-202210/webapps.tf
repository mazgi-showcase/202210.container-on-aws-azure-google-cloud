# Azure Container Apps is not yet supported by Terraform.
# https://github.com/hashicorp/terraform-provider-azurerm/issues/14122

resource "azurerm_service_plan" "main-linux-docker" {
  name                = "${var.project_unique_id}-main-linux-docker"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  # See also https://azure.microsoft.com/en-us/pricing/details/app-service/windows/#pricing
  # > Basic Service Plan
  # > The Basic service plan with Linux runtime environments supports Web App for Containers.
  sku_name = "B1"
  tags     = {}
}

resource "azurerm_linux_web_app" "main-linux-docker" {
  name                = "${var.project_unique_id}-main-linux-docker"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  service_plan_id     = azurerm_service_plan.main-linux-docker.id
  https_only          = false
  site_config {
    application_stack {
      docker_image     = "mcr.microsoft.com/azuredocs/containerapps-helloworld"
      docker_image_tag = "latest"
    }
  }
  tags = {}
}
