# modules/sql_database/variables.tf

variable "sql_server_name" {}
variable "sql_admin_username" {}
variable "sql_admin_password" {}
variable "sql_database_name" {}
variable "sql_database_performance_level" {}  # Example: "S1"
variable "sql_database_max_size" {}  # Example: 2147483648 (2GB)
variable "resource_group_name" {}
variable "location" {}
variable "environment" {}
variable "db_subnet_id" {}

