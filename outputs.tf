
output "nsg_rule_ids" {
  value = [for rule in module.network_security_rule : rule.rule_id]
}

output "nsg_id" {
  value = module.network_security_group.nsg_id
}

output "nsg_name" {
  value = module.network_security_group.nsg_name
}

