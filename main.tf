resource "azurerm_resource_group" "rg1" {
  name     = "rg-log-demo"
  location = "East US"
}

resource "azurerm_storage_account" "sa1" {
  name                     = "arunlogstorage1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "logs1" {
  name                  = "applicationlogs"
  storage_account_id    = azurerm_storage_account.sa.id

  container_access_type = "private"
}
