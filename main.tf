
module "resource_group" {
  source      = "./modules/resource_group"
  name        = var.resource_group_name
  location    = var.location
  environment = var.environment
}

module "virtual_network" {
  source              = "./modules/virtual_network"
  name                = var.vnet_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = var.vnet_address_space
  environment         = var.environment
}

module "web_subnet" {
  source                    = "./modules/subnet"
  name                      = var.subnet1
  resource_group_name       = module.resource_group.resource_group_name
  virtual_network_name      = module.virtual_network.vnet_name
  subnet_address_prefixes   = var.subnet1_address_prefixes
  network_security_group_id = module.network_security_group.nsg_id
}

module "db_subnet" {
  source                    = "./modules/subnet"
  name                      = var.subnet2
  resource_group_name       = module.resource_group.resource_group_name
  virtual_network_name      = module.virtual_network.vnet_name
  subnet_address_prefixes   = var.subnet2_address_prefixes
  network_security_group_id = null
  service_endpoints         = ["Microsoft.Sql"] 

}

module "network_security_group" {
  source              = "./modules/network_security_group"
  nsg_name            = var.nsg_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  environment         = var.environment
}

locals {
  network_security_rules = {
    "allow-http" = {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    "allow-https" = {
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

module "network_security_rule" {
  source   = "./modules/network_security_rule"
  for_each = local.network_security_rules

  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = module.resource_group.resource_group_name
  network_security_group_name = module.network_security_group.nsg_name

}

module "web_subnet_association" {
  source                    = "./modules/network_security_group_association"
  subnet_id                 = module.web_subnet.subnet_id
  network_security_group_id = module.network_security_group.nsg_id
  count                     = 1
  depends_on = [ module.web_subnet ]
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  public_ip_name      = var.public_ip_name
  lb_name             = var.lb_name
  frontend_ip_name    = var.frontend_ip_name
  backend_pool_name   = var.backend_pool_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  probe_name          = var.probe_name
  port                = var.port
  interval_in_seconds = var.interval_in_seconds
  protocol            = var.protocol
  probe_protocol      = var.probe_protocol
  rule_name           = var.rule_name
  number_of_probes    = var.number_of_probes
  backend_port        = var.backend_port
  frontend_port       = var.frontend_port
  timeout_in_minutes  = var.timeout_in_minutes
  environment         = var.environment
}


module "virtual_machine_scaleset" {
  source                   = "./modules/virtual_machine_scaleset"
  vmss_name                = var.vmss_name
  resource_group_name      = module.resource_group.resource_group_name
  location                 = module.resource_group.resource_group_location
  subnet_id                = module.web_subnet.subnet_id
  backend_address_pool_ids = [module.load_balancer.backend_pool_id]
  admin_username           = var.admin_username
  vmss_instance_count      = var.vmss_instance_count
  ssh_public_key           = var.ssh_public_key
  vm_size                  = var.vmsize
  publisher                = var.publisher
  offer                    = var.offer
  sku                      = var.sku
  image_version            = var.image_version
  depends_on               = [module.load_balancer]
  environment         = var.environment

}


module "sql_database" {
  source                         = "./modules/sql_database"
  sql_server_name                = var.sql_server_name
  sql_admin_username             = var.sql_admin_username
  sql_admin_password             = var.sql_admin_password
  sql_database_name              = var.sql_database_name
  sql_database_performance_level = var.sql_database_performance_level
  sql_database_max_size          = var.sql_database_max_size
  db_subnet_id                   = module.db_subnet.subnet_id
  resource_group_name            = module.resource_group.resource_group_name
  location                       = module.resource_group.resource_group_location
  environment                    = var.environment
}




