variable "location" {
  description = "The region where the virtual network is created."
  default = "West US"
}
variable "ResourceGroupName" {
  description = "The name for Resource Group"
  default = "rg1"
}
variable "address_space" {
  description = "This address space for the virtual network"
  default = ["10.0.0.0/16"]
}
variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default = "10.0.0.0/24"
}
variable "virtual_network_name" {
  description = "name for virtual network"
  default =  "virtualnetwork"
}





#variable "maptype" {
#  type = "map"
#  default = {
#    subnet1 = "subnet1"
#    subnet2 = "subnet2"
#    subnet3 = "subnet3"
#  }
#}




