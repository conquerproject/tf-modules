provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  name                 = each.value.name
  address_prefixes     = each.value.address_prefix
}