location = "West US"
ResourceGroupName = "rg1"
virtual_network_name = "virtualnetwork"
####
### CUSTOM RULES FROM VM ###
custom_rules = [
  {
    name = "ssh"
    priority = "100"
    direction = "Inbound"
    access = "Deny"
    protocol = "tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    destination_port_range = "22"
    description = "denny access on 22 port"
  }
]

### ENABLE/DISABLI PUBLIC IP ###
disable_public_ip = "true"



