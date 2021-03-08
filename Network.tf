# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "Amin_Subnet"
  resource_group_name  = azurerm_resource_group.ab.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create public IP
resource "azurerm_public_ip" "publicip" {
  name                = "myTFPublicIP"
  location            = var.location3
  resource_group_name = azurerm_resource_group.ab.name
  allocation_method   = "Static"
}


# Create Network Security Group and rule
#resource "azurerm_network_security_group" "nsg" {
  #name                = "myTFNSG"
  #location            = "westus2"
  #resource_group_name = azurerm_resource_group.rg.name
#
  #security_rule {
    #name                       = "SSH"
    #priority                   = 1001
    #direction                  = "Inbound"
    #access                     = "Allow"
    #protocol                   = "Tcp"
    #source_port_range          = "*"
    #destination_port_range     = "22"
    #source_address_prefix      = "*"
    #destination_address_prefix = "*"
  #}
#}

# Create network interface
resource "azurerm_network_interface" "nic" {
  name                      = "01NIC"
  location                  = var.location3
  resource_group_name       = azurerm_resource_group.ab.name

  ip_configuration {
    name                          = "myNICConfg"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}