output "nsg_id" { 
  value       = azurerm_network_security_group.eib_nsg.id
}

output "nsg_name" {
  value       = azurerm_network_security_group.eib_nsg.name
}
