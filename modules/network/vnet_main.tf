#### -- resource for Task2 -- ####

resource "azurerm_resource_group" "rg" {
  name = "${var.ResourceGroupName}"
  location = "${var.location}"
  tags = {
          environment = "${var.tag_prod}"
 }
}

resource "azurerm_virtual_network" "arm_vnet_01" {
  name = "${var.virtual_network_name}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  # link with resource group
  location = "${azurerm_resource_group.rg.location}"
  address_space = "${var.address_space}"
  tags = {
    environment = "vnet_01"
  }

}

#### -- for SUBNET -- ####
resource "azurerm_subnet" "arm_subnet" {
  count                = "${var.count_index}"
  name	               = "${element(var.subnet_name,count.index)}"
  virtual_network_name = "${azurerm_virtual_network.arm_vnet_01.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${element(var.subnet_prefix, count.index)}"
}

#### -- for CREATE PUBLIC IP ADDRESS -- ####
resource "azurerm_public_ip" "arm-pub-ip" {
  count				  = "${var.disable_public_ip ? 2 : 0}"
  name                = "${lookup(var.pub_ip_name, count.index)}"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  allocation_method   = "Dynamic"
  tags                = { environment = "${var.tag_prod}" }

}





