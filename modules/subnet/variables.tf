variable "name" {}
variable "resource_group_name" {}
variable "virtual_network_name" {}
variable "subnet_address_prefixes" {
  type = list(string)
}
variable "network_security_group_id" {}
variable "service_endpoints" {
  description = "A list of service endpoints to enable on the subnet"
  type        = list(string)
  default     = []
}
