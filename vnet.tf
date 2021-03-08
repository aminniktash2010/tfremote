# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "AminTFVnet"
    address_space       = ["10.0.0.0/16"]
    location            = var.location3
    resource_group_name = azurerm_resource_group.ab.name
}
