provider "azurerm" {
  features {}
  tenant_id       = "46c6daf9-99a7-428d-bb72-0da61e9361ed"
  subscription_id = "70b03d67-56bd-4483-8274-f4966fb4bdc5"
}

resource "azurerm_resource_group" "example" {
  name     = "rg-example"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "example" {
  name                = "app-service-plan-example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "example-app-service-mo"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    linux_fx_version = "NODE|18-lts"
  }
}
