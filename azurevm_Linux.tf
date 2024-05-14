resource "azurerm_linux_virtual_machine" "san_Linux_vm1" {
name = "san-linux-vm1"
resource_group_name = data.azurerm_resource_group.san_resource-group1.name
location = data.azurerm_resource_group.san_resource-group1.location
size = "standard_F2"
network_interface_ids = [ azurerm_network_interface.san_virtual_networkinterface.id ]
admin_username = "sanadmin"
admin_password = "Passw0rd@12345678"
disable_password_authentication = false

os_disk {

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
source_image_reference {
publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
}
    
  }
