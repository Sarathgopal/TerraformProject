output "azuresql_server_name" {
  value = azurerm_sql_server.sql_server.name
}

output "azuresql_data_name" {
  value = azurerm_sql_database.sql_database.name
}

