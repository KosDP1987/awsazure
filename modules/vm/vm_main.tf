resource "azurerm_network_interface" "arm-nic" {
  count = "${var.count_index}"
  name = "${element(var.vnet_name, count.index)}"
  location = "${var.location}"
  resource_group_name = "${var.ResourceGroupName}"

  ip_configuration {
    name = "ip_configuration-${count.index}"
    subnet_id = "${element(var.arm_subnet_id, count.index)}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = "${var.disable_public_ip != "true" ? element(concat((var.pub_ip_id), list("")), count.index) : "" }"
  }
}
  /*tags = {
    environment = "${var.tag_prod}"
  }*/


resource "azurerm_virtual_machine" "arm-vm" {
  count                 = "${var.count_index}"
  name                  = "${element(var.vm_name, count.index)}"
  location              = "${var.location}"
  resource_group_name   = "${var.ResourceGroupName}"
  network_interface_ids = ["${azurerm_network_interface.arm-nic[count.index].id}"]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.computer_name}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "${var.tag_prod}"
  }
}