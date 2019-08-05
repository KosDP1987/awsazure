variable "tag_prod" {}
#### -- azurerm_resource_group -- ####
variable "location" {}
variable "ResourceGroupName" {}

#### -- azurerm_virtual_network -- ####
variable "virtual_network_name" {}
variable "address_space" {}
variable "vnet_name" {type = "list"}
variable "vm_name"   {type = "list"}

#### -- azurerm_subnet -- ####
variable "subnet_prefix" {}
variable "arm_subnet_id" {}

#### -- count -- ####
variable "count_index" {}
variable "disable_public_ip" {}
variable "pub_ip_id" {}

#### -- for OS -- ####
variable "computer_name" {}
variable "admin_username" {}
variable "admin_password" {}
