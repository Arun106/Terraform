resource "azurerm_resource_group" "rg" {
  name     = "rg-log-demo"
  location = "East US"
}

resource "azurerm_storage_account" "sa" {
  name                     = "arunlogstorage12345"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "logs" {
  name                  = "applicationlogs"
  storage_account_id    = azurerm_storage_account.sa.id

  container_access_type = "private"
}
