variable "vnet_name" {
  description = "vnet name"
  type        = string
}

variable "vnet_address_space" {
  description = "vnet total range with netmask"
  type        = list(string)
}

variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "location" {
  description = "resource group location"
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    name           = string
    address_prefix = list(string)
  }))
}

variable "tags" {
  description = "resource tags"
  type        = map(string)
}