variable "location" {
  description = "The location/region where the resources should be created in."
  default     = "East US"
  type        = string
}


variable "azurerm_resource_group_name" {
    default = "azure-events-rg"
    type = string
    description = "The name of the Container Group"
}

variable "web_app_name" {
    default = "azure-events-web"
    type = string
    description = "The name of the Container Group"
}

variable "service_plan_name" {
    default = "azure-events-service-plan"
    type = string
    description = "The name of the Container Group"
}