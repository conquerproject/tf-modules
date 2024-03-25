variable "app_name" {
  description = "Azure application name"
  type        = string
}

variable "owners" {
  default = null
  type = list(string)
}

variable "prevent_duplicate_names" {
  description = "Prevent duplication name from Applicatons"
  type        = bool
  default     = true
}

variable "subjects"{
  type = list(string)
}

variable "permissions" {
  description = "Role Assignments permissions" 
  type        = map(list(string))
}

variable "required_resource_accesses" {
  type = list(object({
    resource_app_id = string
    resource_access = list(object({
      id   = string
      type = string
    }))
  }))
  description = "List of required resource access configurations"
}

variable "self_owner" {
  description = "Add Service Principal as Owner"
  type        = bool

  default = true
}
