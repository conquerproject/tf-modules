variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "location" {
  description = "resource group location"
  type        = string
}

variable "tags" {
  description = "resource tags"
  type        = map(string)
}