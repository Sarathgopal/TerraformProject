terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"
    storage_account_name = "terraformstorageebi"
    container_name       = "tfstate1"
    key                  = "<env>/terraform.tfstate"
  }
}
