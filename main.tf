#### -- TASK 1 -- Configure the Azure Provider -- ####

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

#### -- TASK 2 -- create module for network ####
module "network" {
  source               = "./modules/network/"
  count_index          = "${var.count_index}"
  virtual_network_name = "${var.virtual_network_name}"
  location             = "${var.location}"
  ResourceGroupName    = "${var.ResourceGroupName}"
  subnet_name          = "${var.subnet_name}"
  subnet_prefix        = "${var.subnet_prefix}"
  address_space        = "${var.address_space}"
  pub_ip_name          = "${var.pub_ip_name}"
  disable_public_ip    = "${var.disable_public_ip}"
  tag_prod             = "${var.tag_prod}"
}

#### -- TASK 2 -- create vm  ####
module "vm" {
  source               = "./modules/vm/"
  address_space        = "${var.address_space}"
  subnet_prefix        = "${var.subnet_prefix}"
  virtual_network_name = "${var.virtual_network_name}"
 ## -- for net_interface --
  location             = "${var.location}"
  vnet_name            = "${var.vnet_name}"
  ResourceGroupName    = "${module.network.ResourceGroupName_out}"
  arm_subnet_id            = "${module.network.arm_subnet_id}"
 ## -- for vm --
  count_index          = "${var.count_index}"
  vm_name              = "${var.vm_name}"
  disable_public_ip    = "${var.disable_public_ip}"
  pub_ip_id            = "${module.network.pub_ip_id}"
  tag_prod             = "${var.tag_prod}"
 ## -- for os_profile --
  computer_name  		= "${var.computer_name}"
  admin_username 		= "${var.admin_username}"
  admin_password 		= "${var.admin_password}"
 ##
}

####  --  Task 3 -- ####

output "ResourceGroupName"{
  value = "${module.network.ResourceGroupName_out}"
}

output "subnet_id"{
  value = "${module.network.arm_subnet_id}"
}

output "pub_ip_id" {
  value = "${module.network.pub_ip_id}"
}

#### -- Task 4 -- ####

module "sg" {
  source                = "./modules/sg"
  on_off_module  	    = "${var.on_off_module}"
  net_sec_group_name   	= "${var.net_sec_group_name}"
  location           	= "${var.location}"
  ResourceGroupName	    = "${module.network.ResourceGroupName_out}"
  net_sec_inrule_name 	= "${var.net_sec_inrule_name}"
  net_sec_outrule_name 	= "${var.net_sec_outrule_name}"
  custom_rules          = "${var.custom_rules}"
}


