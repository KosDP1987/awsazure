#### -- create new module for security group --  ####
## -- create security group --  ##
resource "azurerm_network_security_group" "arm_sg" {
  name                = "${var.net_sec_group_name}"
  location            = "${var.location}"
  resource_group_name = "${var.ResourceGroupName}"
}

resource "azurerm_network_security_rule" "inrule" {
  network_security_group_name = "${azurerm_network_security_group.arm_sg.name}" # link with resource "azurerm_network_security_group"
  name = "${var.net_sec_inrule_name}"
  access = "Allow"
  direction = "Inbound"
  priority = 100
  protocol = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "21"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name = "${var.ResourceGroupName}"

}
resource "azurerm_network_security_rule" "outrule" {
  network_security_group_name = "${azurerm_network_security_group.arm_sg.name}" # link with resource "azurerm_network_security_group
  name = "${var.net_sec_outrule_name}"
  access = "Allow"
  direction = "Outbound"
  priority = 100
  protocol = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name = "${var.ResourceGroupName}"

}
#### -- custom rule -- ####
resource "azurerm_network_security_rule" "custom_rule" {
  count               = "${length(var.custom_rules)}"
  resource_group_name = "${var.ResourceGroupName}"
  name                = "${lookup(var.custom_rules[count.index], "name", "default_rule_name")}"
  priority            = "${lookup(var.custom_rules[count.index], "priority")}"
  direction           = "${lookup(var.custom_rules[count.index], "direction", "Any")}"
  access              = "${lookup(var.custom_rules[count.index], "access", "Allow")}"
  protocol            = "${lookup(var.custom_rules[count.index], "protocol", "*")}"

  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "${lookup(var.custom_rules[count.index], "source_address_prefix", "*")}"
  network_security_group_name = "${azurerm_network_security_group.arm_sg.name}"

}

/*
#### TEST ####
resource "azurerm_network_security_rule" "some_custom_rules" {
  count                       = "${length(var.custom_rules)}"
  name                        = "${lookup(var.custom_rules[count.index], "name", "default_rule_name")}"
  priority                    = "${lookup(var.custom_rules[count.index], "priority")}"
  direction                   = "${lookup(var.custom_rules[count.index], "direction", "Any")}"
  access                      = "${lookup(var.custom_rules[count.index], "access", "Allow")}"
  protocol                    = "${lookup(var.custom_rules[count.index], "protocol", "*")}"
  source_port_ranges          = "${split(",", replace(  "${lookup(var.custom_rules[count.index], "source_port_range", "*" )}"  ,  "*" , "0-65535" ) )}"
  destination_port_ranges     = "${split(",", replace(  "${lookup(var.custom_rules[count.index], "destination_port_range", "*" )}"  ,  "*" , "0-65535" ) )}"
  source_address_prefix       = "${lookup(var.custom_rules[count.index], "source_address_prefix", "*")}"
  destination_address_prefix  = "${lookup(var.custom_rules[count.index], "destination_address_prefix", "*")}"
  description                 = "${lookup(var.custom_rules[count.index], "description", "Security rule for ${lookup(var.custom_rules[count.index], "name", "default_rule_name")}")}"
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${azurerm_network_security_group.nsg_1.name}"
}
*/
