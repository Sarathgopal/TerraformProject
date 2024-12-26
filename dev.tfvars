# Resource Group Value
resource_group_name = "rg-dev-eib"           
location            = "North Europe"
environment         = "dev"

# Virtual Network Value
vnet_name                = "vnet-dev-eib"     
vnet_address_space       = ["10.2.0.0/16"]
subnet_name              = "subnet-dev-eib"   
subnet1_address_prefixes = ["10.2.0.0/24"]
subnet2_address_prefixes = ["10.2.1.0/24"]
nsg_name                 = "nsg-dev-eib"     
subnet1                  = "subnet-dev-web"     
subnet2                  = "subnet-dev-db"   

# LoadBalancer Value 
public_ip_name    = "pip-dev-public-ip"      
lb_name           = "lb-dev-eib"             
frontend_ip_name  = "lb-dev-frontend-ip"    
backend_pool_name = "lb-dev-backend-pool"   

# Virtual Machine Scaleset Value 
vmss_name                = "vmss-dev-eib"           
vmss_instance_count      = 2
probe_name               = "probe-dev-http"          
protocol                 = "Tcp"
probe_protocol           = "Http"
interval_in_seconds      = 5
number_of_probes         = 2
rule_name                = "rule-dev-http"          
frontend_port            = 80
backend_port             = 80
timeout_in_minutes       = 5
publisher                = "Canonical"
offer                    = "UbuntuServer"
sku                      = "18.04-LTS"
image_version            = "latest"
vmsize                   = "Standard_B1s"
port                     = 80
backend_address_pool_ids = ["backend-pool-id"]
admin_username           = "adminuser"
username                 = "adminuser"
ssh_public_key           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCp4oG5BHwRuTLUDuKbZy+mPmMJbvLsvEXm6CrS7N1ovWn6k6fjqh08FsHj/vIUQEzZvTQxKyUhzeHJiHLDEfZ4surl2wAK1JGmC4w8jL6F58FXzrxtrWmnQ4iZCf8sAHZf6XdSlOz2L2asxWTovtTaRObe5vpQmXU626eKW+wm51wGu2zWCzWukTprgYmiCLBYHm9wiOn+EBv5P2TH2wgpSfwF5Yv2+nnf/AAHA5SM3rPvRuXxnHW/JDZqotSYbA8WWVtA5YfxMVKlJbQK2jiFj6MjvNY4w5P4paIyyDCCkF2Fi3PLHSphHQii26Dt4bU59q36hhn3FqN8LYHpy3lqyOjxtJTxzmbP4R8k48UhXv3x575DgNz8Ds4oI7sA5Wq8tlUqb/Ls77aWWoF5UEnNSCT56Px0Ie9C3WDabfnNBvmtBeeIX69VuFjeOjudWyY8p/wyAk87JO6Vq9BFgInRbIo0b12CWmnRUdv1DtFmlWAjOsZ9g6VwT7JPS0H7Q0M= sarat@Sarath-PC"

# SQL Server & Database 
sql_server_name                = "sql-dev-eib-server"   
sql_admin_username             = "sqladmin"
sql_admin_password             = "Password123"
sql_database_name              = "db-dev-eib"        
sql_database_performance_level = "S1"
sql_database_max_size          = 2147483648  # 2GB
