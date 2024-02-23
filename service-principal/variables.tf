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
