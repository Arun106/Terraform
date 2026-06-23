variable "name" {
  description = "Public IP name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "allocation_method" {
  description = "Public IP allocation method"
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "Public IP SKU"
  type        = string
  default     = "Standard"
}

variable "replace_trigger_value" {
  description = "Change this value to force replacement of Public IP"
  type        = string
  default     = "v1"
}
