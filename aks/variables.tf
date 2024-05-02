variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "aks_name" {
  description = "AKS Cluster name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "node_pool_name" {
  description = "AKS Node Pool Name"
  type        = string
  default     = "default"
}

variable "node_pool_count" {
  description = "Number of Nodes the node pool should have"
  type        = number
  default     = 1
}

variable "node_pool_vm_size" {
  description = "VM Size of the Nodes"
  type        = string
}

variable "tags" {
  description = "Resources tags"
  type        = map(string)
} 

variable "k8s_version" {
  description = "The version of Kubernetes"
  type = string
}

variable "network_plugin" {
  description = "Network plugin to use for networking"
  type = string
  default = "azure"
}

variable "network_plugin_mode" {
  description = "the network plugin mode used for building the Kubernetes network"
  type = string
  default = "overlay"
}
