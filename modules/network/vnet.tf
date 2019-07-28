#### -- Task2 -- ####
/*resource "azurerm_resource_group" "rg" {
 name = "${var.RGname}"
 location = "${var.location}"
 tags = {
  environment = "${var.RGname}-${var.location}"
 }
}*/

resource "azurerm_virtual_network" "arm_vnet_01" {
 name = "dev-vnet-01"
 resource_group_name = "rg1"
 location = "West US"
 address_space = "[10.0.0.0/16]"

 /*
 name = "${var.virtual_network_name}"
 resource_group_name = "${var.RGname}"
 address_space = ["${var.address_space}"]
 location = "${var.location}"
 */
 tags = { environment = "arm_vnet_01" }
}

/*
resource "azurerm_subnet" "subnet" {
 name = "subnet1"
 resource_group_name = "${var.RGname}"
 virtual_network_name = "virtualnetwork1"
 address_prefix = "${var.subnet_prefix}"
}
*/
