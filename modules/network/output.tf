
output "virtual_network_name" {
  value = "${azurerm_virtual_network.arm_vnet_01.name}"
}
#output "subnet_prefix" {
#  value = "${azurerm_virtual_network.arm_vnet_01.subnet.address_prefix}"
#}

output "arm_subnet_id" {
  value = "${azurerm_subnet.arm_subnet.*.id}"
}
output "ResourceGroupName" {
  value = "${azurerm_resource_group.rg.name}"
}
output "ResourceGroupName_out" {
  value = "${azurerm_resource_group.rg.name}"
}
output "pub_ip_id" {
  value = "${azurerm_public_ip.arm-pub-ip.*.id}"
}

