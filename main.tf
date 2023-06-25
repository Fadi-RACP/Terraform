resource "azurerm_resource_group" "Test-grp" {
  name     = "${terraform.workspace}-grp"
  location = local.location
}

resource "azurerm_virtual_network" "Test-VNet" {
  name                = "${terraform.workspace}-VNet"
  location            = local.location 
  resource_group_name = azurerm_resource_group.Test-grp.name
  address_space       = [local.virtual_network.address_space]
  depends_on = [
    azurerm_resource_group.Test-grp
  ]  
} 

resource "azurerm_subnet" "Test-Subnet" {    
    name                 = "${terraform.workspace}-Subnet"
    resource_group_name  = azurerm_resource_group.Test-grp.name
    virtual_network_name = azurerm_virtual_network.Test-VNet.name
    address_prefixes     = [cidrsubnet(local.virtual_network.address_space,4,0)]
    depends_on = [
      azurerm_virtual_network.Test-VNet
    ]
}
/*
resource "azurerm_subnet" "Test-Subnet2" {    
    name                 = "${terraform.workspace}-SubnetA"
    resource_group_name  = azurerm_resource_group.Test-grp.name
    virtual_network_name = azurerm_virtual_network.Test-VNet.name
    address_prefixes     = [cidrsubnet(local.virtual_network.address_space,4,1)]
    depends_on = [
      azurerm_virtual_network.Test-VNet
    ]
}
*/
