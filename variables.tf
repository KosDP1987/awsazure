#### -- for provider -- ####
variable "subscription_id"      {  default = "b293c8ac-7375-4e77-9c21-d86b29b1e8e3" }
variable "client_id"            {  default = "b80a4785-ef51-45af-be70-cc050122f701" }
variable "client_secret"        {  default = "f+TT158.5ios-/0lOf?2sTIerEE9xdsQ" }
variable "tenant_id"            {  default = "9ef97a93-39c9-44c3-af45-dbaccc1593b7" }
####
#### -- for network -- ####

variable "location" {
  description = "The region where the virtual network is created."
  default = "West US"
}
variable "ResourceGroupName" {
  description = "The name for Resource Group"
  default = "rg1"
}
variable "virtual_network_name" {
  description = "name for virtual network"
  default = "virtualnetwork"
}
variable "subnet_name" {
  description = "This names for subnet1 and subnet2"
  default = ["subnet1","subnet2"]
}
variable "address_space" {
  description = "This address space for the virtual network"
  default = ["10.0.0.0/16"]
}
variable "subnet_prefix" {
  description = "The address prefix to use for the subnet."
  default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "tag_prod" {
  description = "Tag for environment "
  default = "Prodaction"
}

#### -- for VM -- ####
## - vnet - ##
variable "vnet_name"             { default = ["vnet1","vnet2","vnet3"]  }
##
variable "vm_name"               { default = ["vm1","vm2","vm3"]}
variable "count_index"           { default = "2"   }
variable "disable_public_ip"     { default = true  }
## - for - OS -- ##
variable "computer_name"        { default = "hostname"     }
variable "admin_username"       { default = "testadmin"    }
variable "admin_password"       { default = "Password_123" }
####
#### -- for module-network-security-group --  ####
variable "net_sec_group_name"   { default = "network_security_group"  }
variable "net_sec_inrule_name"  { default = "network_security_inrule" }
variable "net_sec_outrule_name" { default = "network_security_outrule"}
variable "on_off_module"        { default = "true"                    }
variable "custom_rules"         { default = []                        }
####
#### -- for public ip -- ####
variable "pub_ip_name" {
  default = {
    "0" = "pub_ip_1"
    "1" = "pub_ip_2"
  }
}
####





