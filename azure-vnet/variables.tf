variable "vnet_name" {
  description = "vnet name"
  type        = string
}

variable "vnet_address_space" {
  description = "vnet total range with netmask"
  type = list(string)
}

variable "subnet_prefixes" {
  description = "subnets prefixes inside the vnet"
  type = list(string)
}

variable "subnet_names" {
  description = "subnets names inside the vnet"
  type = string
}

variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "location" {
  description = "resource group location"
  type        = string
}