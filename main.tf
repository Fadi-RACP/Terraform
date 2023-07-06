resource "azurerm_resource_group" "Test-grp" {
  name     = "${terraform.workspace}-grp"
  location = local.location
  tags = {
    "CostCentre" = "RACP"
    "Environment" = "Test"
  }
}

resource "azurerm_virtual_network" "Test-VNet" {
  name                = "${terraform.workspace}-VNet"
  location            = local.location 
  resource_group_name = azurerm_Resource_Group.Test-grp.name
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
    resource_group_name  = azurerm_Resource_Group.Test-grp.name
    virtual_network_name = azurerm_virtual_network.Test-VNet.name
    address_prefixes     = [cidrsubnet(local.virtual_network.address_space,4,0)]
    depends_on = [
      azurerm_virtual_network.Test-VNet
    ]
}

/*
resource "azurerm_subnet" "Test-Subnet2" {    
    name                 = "${terraform.workspace}-Subnet2"
    resource_group_name  = azurerm_resource_group.Test-grp.name
    virtual_network_name = azurerm_virtual_network.Test-VNet.name
    address_prefixes     = [cidrsubnet(local.virtual_network.address_space,4,1)]
    depends_on = [
      azurerm_virtual_network.Test-VNet
    ]
}
*/
