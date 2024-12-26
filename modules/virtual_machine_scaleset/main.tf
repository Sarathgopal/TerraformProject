resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name                = var.vmss_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.vm_size
  instances           = var.vmss_instance_count
  upgrade_mode        = "Automatic"

   admin_username      = var.admin_username
  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }
 os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.image_version
  }
  network_interface {
    name    = "${var.vmss_name}-nic"
    primary = true
    ip_configuration {
      name                                   = "internal"
      primary                                = true
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = var.backend_address_pool_ids
    }
  }
  tags = {
    environment = var.environment
  }
 
}

