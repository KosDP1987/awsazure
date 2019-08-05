output "private_ip" {
  value = "${azurerm_network_interface.arm-nic.*.private_ip_address}"
}
