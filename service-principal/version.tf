terraform {
  required_version = "~> 1.0"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.46"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.92"
    } 
 }
}
