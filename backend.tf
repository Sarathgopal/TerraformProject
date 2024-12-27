terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"
    storage_account_name = "terraformstorageeib"
    container_name       = "tfstate"
    key                  = "${terraform.workspace}/terraform.tfstate"
  }
}
