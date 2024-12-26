variable "environment" {}
variable "resource_group_name" {}
variable "vnet_name" {}
variable "location" {}
variable "vnet_address_space" {
  type = list(string)
}
variable "subnet_name" {}
variable "subnet1_address_prefixes" {}
variable "subnet2_address_prefixes" {}
variable "nsg_name" {}
variable "subnet1" {}
variable "subnet2" {}
variable "service_endpoints" {
  description = "A list of service endpoints to enable on the subnet"
  type        = list(string)
  default     = []
}
variable "backend_pool_name" {}
variable "probe_name" {}
variable "public_ip_name" {}
variable "lb_name" {}
variable "frontend_ip_name" {}
variable "protocol" {}
variable "port" {}
variable "interval_in_seconds" {}
variable "number_of_probes" {}
variable "rule_name" {}
variable "frontend_port" {}
variable "backend_port" {}
variable "timeout_in_minutes" {}
variable "ssh_public_key" {}
variable "vmss_name" {}
variable "username" {}
variable "vmss_instance_count" {}
variable "admin_username" {}
variable "vmsize" {}
variable "publisher" {}
variable "offer" {}
variable "sku" {}
variable "image_version" {}
variable "probe_protocol" {}
variable "sql_server_name" {}
variable "sql_admin_username" {}
variable "sql_admin_password" {}
variable "sql_database_name" {}
variable "sql_database_performance_level" {} # Example: "S1"
variable "sql_database_max_size" {}          # Example: 2147483648 (2GB)



