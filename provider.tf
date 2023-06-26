terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.55.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.39.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "f107218a-dbce-4907-ae09-f7916aa43d80"
  tenant_id = "09c2d83f-ca57-4dad-8a0b-502b18e773e8"
  client_id = "aa696f96-e7b9-4814-9033-3785a2320c60"
  client_secret = "u648Q~HeeHfAUa1tlPQtjlVkpd9.ZweieqVZ2dvj"
  features {}
}

provider "azuread" {
  tenant_id = "09c2d83f-ca57-4dad-8a0b-502b18e773e8"
}

/*#
cloud {
    organization = "RACP"

    workspaces {
      name = "Test-Workspace"
    }
*/