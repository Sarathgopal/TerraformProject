variable "vmss_name"{} 
variable "resource_group_name" {}
variable "location" {}
variable "vm_size" {}
variable  "vmss_instance_count" {}
variable "ssh_public_key" {}
variable "subnet_id" {}
variable "admin_username" {}
variable "backend_address_pool_ids" {
    type        = list(string)
}
variable "publisher"{}
variable "offer"{}
variable "sku"{}
variable "image_version"{}
variable "environment" {}


