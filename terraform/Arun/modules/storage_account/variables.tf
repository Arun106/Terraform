variable "resource_group_name" {
  type    = string
  default = "Arunrg2"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "storage_account_name" {
  type    = string
  default = "arunstorageaccount11"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}
