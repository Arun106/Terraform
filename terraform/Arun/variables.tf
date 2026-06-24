variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = "e377d444-6055-48ff-b11c-588edaf7da68"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "rg_name" {
  description = "Azure Resource Group name"
  type        = string
  default     = "rg-arun-dev"
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

variable "public_ip_name" {
  description = "Public IP name"
  type        = string
  default     = "pip-arun-dev"
}

variable "public_ip_allocation_method" {
  description = "Public IP allocation method"
  type        = string
  default     = "Static"
}

variable "public_ip_sku" {
  description = "Public IP SKU"
  type        = string
  default     = "Standard"
}

variable "storage_account_name" {
  description = "Storage Account name. Must be lowercase and globally unique."
  type        = string
  default     = "arunstorageacct2026"
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Storage replication type"
  type        = string
  default     = "LRS"
}
