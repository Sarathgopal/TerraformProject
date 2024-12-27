Overview
This repository contains Terraform configurations for managing cloud infrastructure. The setup is modular, allowing reusability and scalability. It supports multiple environments (dev and prod) and is configured to provision resources on Azure using the azurerm provider.

Project Structure
Root Files
•	backend.tf: Defines the remote backend for storing Terraform state.
•	dev.tfvars & prod.tfvars: Contains environment-specific variables.
•	main.tf: Entry point for the Terraform configuration.
•	outputs.tf: Specifies the outputs of the Terraform configuration.
•	provider.tf: Configures the required providers (e.g., Azure).
•	variables.tf: Declares input variables for the configuration.


Modules are reusable components that encapsulate specific infrastructure resources.
Available Modules

1.	Resource Group
o	Files: main.tf, outputs.tf, variables.tf
o	Creates Azure resource groups.

2.	Virtual Network
o	Files: main.tf, outputs.tf, variables.tf
o	Creates a virtual network in Azure.

3.	Subnet
o	Files: main.tf, outputs.tf, variables.tf
o	Manages Azure subnets.

4.	Load Balancer
o	Files: main.tf, outputs.tf, variables.tf
o	Provisions and configures a load balancer.

5.	Network Security Group (NSG)
o	Files: main.tf, outputs.tf, variables.tf
o	Manages NSG resources.

6.	Network Security Group Association
o	Files: main.tf, outputs.tf, variables.tf
o	Links NSGs to subnets or NICs.

7.	Network Security Rule
o	Files: main.tf, outputs.tf, variables.tf
o	Defines security rules for NSGs.

8.	SQL Database
o	Files: main.tf, outputs.tf, variables.tf
o	Provisions an Azure SQL database.

9.	Virtual Machine Scale Set (VMSS)
o	Files: main.tf, outputs.tf, variables.tf
o	Configures a VMSS for scalable compute.



.terraform Directory
Contains provider binaries, modules metadata, and the Terraform state.

Prerequisites
•	Terraform CLI (v1.x or later)
•	Azure CLI for authentication
•	Access to an Azure subscription

Usage
1.	Initialize the project:
terraform init
2.	Select the environment:
o	For dev environment:
terraform plan -var-file=dev.tfvars
o	For prod environment:
terraform plan -var-file=prod.tfvars
3.	Apply the configuration:
terraform apply -var-file=<environment>.tfvars
4.	Destroy the infrastructure:
terraform destroy -var-file=<environment>.tfvars
Outputs
The outputs.tf file defines various outputs, such as resource group names, load balancer IPs, and database connection strings, which can be referenced post-provisioning.

Modular Design
Each module is designed to:
•	Be independent and reusable
•	Support parameterization via variables


Notes:
•	Make sure the  Azure account has the necessary permissions to create resources in the specified resource group and region

