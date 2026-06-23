variable "resource_group_name" {
  description = "Resource Group name where VNet will be created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "List of VNet names"
  type        = list(string)
  default     = ["tf-vnet1", "tf-vnet2"]
}

variable "address" {
  description = "List of VNet address spaces"
  type        = list(string)
  default     = ["10.1.0.0/16", "10.2.0.0/16"]
}
