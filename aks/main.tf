provider "azurerm" {
  features {}
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_name
  kubernetes_version  = var.k8s_version
  network_profile {
    network_plugin = var.network_plugin
    network_plugin_mode = var.network_plugin_mode
  }

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_pool_count
    vm_size    = var.node_pool_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
    