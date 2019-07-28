#### -- Task2 -- ####

resource "azurerm_virtual_network" "arm_vnet_01" {
 name = "${var.virtual_network_name}"
 resource_group_name = "${var.ResourceGroupName}"
 location = "${var.location}"
 address_space = "${var.address_space}"
 tags = { environment = "vnet_01" }

 subnet {
  name = "subnet1"
  address_prefix = "${var.subnet_prefix}"
 }

}


/*
resource "azurerm_subnet" "subnet" {
 name = "subnet1"
 resource_group_name = "${azurerm_virtual_network.arm_vnet_01.resource_group_name}"
 virtual_network_name = "${azurerm_virtual_network.arm_vnet_01.name}"
 address_prefix = "${var.subnet_prefix}"
}
*/


