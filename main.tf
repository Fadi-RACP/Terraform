resource "azurerm_resource_group" "Test-grp" {
  name     = "${terraform.workspace}-grp"
  location = local.location
  tags = {
    "CostCentre" = "RACP"
    "Environment" = "Test"
  }
}

module "Network" {
  source = "./Network"
  Resource_Group_Name = "${terraform.workspace}-grp"
  depends_on = [ azurerm_resource_group.Test-grp ]
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
