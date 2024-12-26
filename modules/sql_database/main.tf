resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  version                      = "12.0"
    tags = {
    environment = var.environment
  }
}

resource "azurerm_sql_database" "sql_database" {
  name                = var.sql_database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
  max_size_bytes      = var.sql_database_max_size  # In bytes (e.g., 2147483648 for 2GB)
  collation           = "SQL_Latin1_General_CP1_CI_AS"
    tags = {
    environment = var.environment
  }
}

resource "azurerm_sql_virtual_network_rule" "db_subnet_vnet_rule" {
  name                = "Allow-DB-Subnet"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sql_server.name
  subnet_id           = var.db_subnet_id  # This is the subnet ID you want to allow

  ignore_missing_vnet_service_endpoint = false
}
