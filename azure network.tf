resource "azurerm_virtual_network" "san_terraform_network" {
resource_group_name = data.azurerm_resource_group.san_resource-group1.name
location = data.azurerm_resource_group.san_resource-group1.location
name = "san-network"
address_space = [ "10.0.0.0/16" ]

}

resource "azurerm_subnet" "san_subnet1" {
name = "san-internal-subnet"
virtual_network_name = resource.azurerm_virtual_network.san_terraform_network.name
resource_group_name = data.azurerm_resource_group.san_resource-group1.name
address_prefixes = [ "10.0.1.0/24" ]
}

resource "azurerm_network_interface" "san_virtual_networkinterface" {
name = "san_network-interface"
resource_group_name = data.azurerm_resource_group.san_resource-group1.name
location = data.azurerm_resource_group.san_resource-group1.location

ip_configuration {
  subnet_id = azurerm_subnet.san_subnet1.id
  private_ip_address_allocation = "Dynamic"
  name = "san-ip1"

 }
  
}

resource "azurermSan_public_ip" "azurermSan_public_ip" {
  name                = "san_public_ip1"
  resource_group_name = data.azurerm_resource_group.san_rsgp.name
  location            = azurerm_resource_group.san_rsgp.location
  allocation_method   = "Static"
}

