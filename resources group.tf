resource "azurerm_resource_group" "san_rsgp" {
  name = "san_resource-group1"
  location = "Central US"  
}

data "azurerm_resource_group" "san_resource-group1" {
name = "san_resource-group1"
}

