#### -- Task2 -- #### create virtual network and subnets

resource "azurerm_virtual_network" "arm_vnet_01" {
 name = "vnet-01"
 location = "${var.location}"
 resource_group_name = "${azurerm_resource_group.rg.name}" # link to resource group dependencies
 address_space = ["10.0.0.0/16"]

 subnet {
  name = "subnet1"
  address_prefix = "10.0.1.0/24"
 }
 subnet {
  name = "subnet2"
  address_prefix = "10.0.2.0/24"
 }

 tags = { environment = "azurerm_virtual_network arm_vnet_01" }

}

