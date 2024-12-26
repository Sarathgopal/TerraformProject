resource "azurerm_resource_group" "eib_rg" {
  name     = var.name
  location = var.location

  tags = {
    environment = var.environment
  }
}
