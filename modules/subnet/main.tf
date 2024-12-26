resource "azurerm_subnet" "eib_subnet" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints = var.service_endpoints
}
