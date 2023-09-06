provider "azurerm" {
  features {}
}

resource "azurerm_app_service_plan" "rg" {
  name                = "dotnetappservic1eplan"
  location            = "East US"
  resource_group_name = "test-gk-rg"
  kind                = "Linux"

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = "dotnet-gk-appservice"
  location            = azurerm_app_service_plan.rg.location
  resource_group_name = azurerm_app_service_plan.rg.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.appservice.id

  site_config {
    dotnet_framework_version = "v4.0"
  }
}