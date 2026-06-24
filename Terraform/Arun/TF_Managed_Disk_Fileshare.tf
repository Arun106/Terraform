# Resource Group
resource "azurerm_resource_group" "rg3" {
  name     = "arun-rg"
  location = "Central India"
}

# Managed Disk
resource "azurerm_managed_disk" "disk" {
  name                 = "arun-disk"
  location             = azurerm_resource_group.rg3.location
  resource_group_name  = azurerm_resource_group.rg3.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 32
}

# Storage Account
resource "azurerm_storage_account" "sa" {
  name                     = "arunstorage123456"
  resource_group_name      = azurerm_resource_group.rg3.name
  location                 = azurerm_resource_group.rg3.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# File Share
resource "azurerm_storage_share" "fileshare" {
  name               = "sharedfiles"
  storage_account_id = azurerm_storage_account.sa.id
  quota              = 50
}

output "disk_id" {
  value = azurerm_managed_disk.disk.id
}

output "fileshare_name" {
  value = azurerm_storage_share.fileshare.name
}
