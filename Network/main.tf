resource "azurerm_virtual_network" "Test-VNet" {
  name                = "${terraform.workspace}-VNet"
  location            = local.location 
  resource_group_name = azurerm_resource_group.Test-grp.name
  address_space       = [local.virtual_network.address_space]
  depends_on = [
    azurerm_resource_group.Test-grp
  ]  
  tags = {
    "Environment" = "Test"
  }
} 

resource "azurerm_subnet" "Test-Subnet" {    
    name                 = "${terraform.workspace}-Subnet1"
    resource_group_name  = azurerm_resource_group.Test-grp.name
    virtual_network_name = azurerm_virtual_network.Test-VNet.name
    address_prefixes     = [cidrsubnet(local.virtual_network.address_space,4,0)]
    depends_on = [
      azurerm_virtual_network.Test-VNet
    ]
}