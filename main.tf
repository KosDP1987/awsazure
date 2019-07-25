###### -- TASK 1 -- Configure the Azure Provider -- ######

provider "azurerm" {
  subscription_id = "b293c8ac-7375-4e77-9c21-d86b29b1e8e3"
  client_id = "b80a4785-ef51-45af-be70-cc050122f701"
  client_secret = "f+TT158.5ios-/0lOf?2sTIerEE9xdsQ"
  tenant_id = "9ef97a93-39c9-44c3-af45-dbaccc1593b7"
}


###### -- variable -- ######

variable "ResourceGroupName" {}
variable "Region" {}
variable "VirtualNetwork01-name" {}
variable "VirtualNetwork01-address-space" {}
######

resource "azurerm_resource_group" "rg1" {
  name = "dev"
  location = "EAST US 2"
  tags { environment = "Body" }

}

resource "azurerm_virtual_network" "arm_vnet_01" {
  name = "dev-vnet-01"
  address_space = [""]
  location = "EAST US 2"
  resource_group_name = "EAST US 2"
  tags { environment = "Dev01" }
}


##### --  -- #####
