variable "name" {}
variable "resource_group_name" {}
variable "location" {}
variable "address_space" {
  type = list(string)
}
variable "environment" {}
