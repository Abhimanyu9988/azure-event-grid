terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.azurerm_resource_group_name
  location = var.location
}

output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}

output "resource_group_location" {
  value = azurerm_resource_group.resource_group.location
}


resource "random_string" "name_suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_service_plan" "asp" {
  name                = var.service_plan_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  os_type             = "Linux"
  sku_name = "P1v3"
}

resource "azurerm_linux_web_app" "linux_webapp" {
  name                = "${var.web_app_name}-${random_string.name_suffix.result}"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  service_plan_id = azurerm_service_plan.asp.id
  public_network_access_enabled = true

  site_config {
    application_stack {
      docker_image_name = " abhimanyubajaj98/azure-event-python-web-app:latest"
      docker_registry_url = "https://index.docker.io"

      #To list all the available stacks, run az webapp list-runtimes --linux
    }
  }
}

output "webapp_url" {
  value = "https://${azurerm_linux_web_app.linux_webapp.name}.azurewebsites.net"
}
