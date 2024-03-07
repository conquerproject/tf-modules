provider "azurerm" {
  features {}
  }

resource "azurerm_virtual_network" "test" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  resource_group_name = var.resource_group_name
  location            = var.location
  }

resource "azurerm_subnet" "test" {
  name                 = var.subnet_names
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_prefixes
  }