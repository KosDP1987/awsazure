###### -- TASK 1 -- Configure the Azure Provider -- ######

provider "azurerm" {
  subscription_id = "b293c8ac-7375-4e77-9c21-d86b29b1e8e3"
  client_id = "b80a4785-ef51-45af-be70-cc050122f701"
  client_secret = "f+TT158.5ios-/0lOf?2sTIerEE9xdsQ"
  tenant_id = "9ef97a93-39c9-44c3-af45-dbaccc1593b7"
}

resource "azurerm_resource_group" "rg" {
  name = "${var.ResourceGroupName}"
  location = "${var.location}"
  #name = "rg1"
  #location = "West US"
  tags = {
    environment = "${var.ResourceGroupName} - ${var.location}"
  }
}


#module "network" {
  #source = "./modules/network/"
  #location = "West US"
  #resource_group_name = "rg1"
  #virtual_network_name = "${var.virtual_network_name}"
  #subnet_prefix = "${var.subnet_prefix}"
#}


##### --  -- #####
