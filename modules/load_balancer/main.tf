
resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    environment = var.environment
  }
}

resource "azurerm_lb" "loadbalancer" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
    tags = {
    environment = var.environment
  }
}


resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = var.backend_pool_name
  loadbalancer_id = azurerm_lb.loadbalancer.id

}

resource "azurerm_lb_probe" "lb_probe" {
  name                = var.probe_name
  loadbalancer_id     = azurerm_lb.loadbalancer.id
  protocol            = var.probe_protocol
  port                = var.port
  request_path        = "/"
  interval_in_seconds = var.interval_in_seconds
  number_of_probes    = var.number_of_probes
}



resource "azurerm_lb_rule" "http_rule" {
  name                           = var.rule_name
  loadbalancer_id                = azurerm_lb.loadbalancer.id
  frontend_ip_configuration_name = var.frontend_ip_name
  probe_id                       = azurerm_lb_probe.lb_probe.id
  protocol                       = var.protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  enable_floating_ip             = false
  idle_timeout_in_minutes        = var.timeout_in_minutes
  load_distribution              = "Default"
}


