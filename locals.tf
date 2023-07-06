
locals {
  resource_group_name = "Test-grp"
  location = "Australia East"
  virtual_network = {
    Name          = "Test-VNet"
    address_space = "10.45.0.0/20"
  }
}

