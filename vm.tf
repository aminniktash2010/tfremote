# Create a Core server virtual machine
resource "azurerm_virtual_machine" "vm" {
  name                  = "server01"
  location              = var.location3
  resource_group_name   = azurerm_resource_group.ab.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "server_os"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "Acronis"
    offer     = "windowsServer"
    sku       = "2019-Datacenter-Core-smalldisk"
    version   = "latest"
  }

  os_profile {
    computer_name  = "winS2019"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
    os_profile_windows_config {
    disable_password_authentication = false
}
}
data "azurerm_public_ip" "ip" {
  name                = azurerm_public_ip.publicip.name
  resource_group_name = azurerm_virtual_machine.vm.resource_group_name
  depends_on          = [azurerm_virtual_machine.vm]
}
