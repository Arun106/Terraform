import {
  to = azurerm_resource_group.rg3
  id = "/subscriptions/e377d444-6055-48ff-b11c-588edaf7da68/resourceGroups/arun-rg"
}

resource "azurerm_resource_group" "rg3" {
  name     = "arun-rg"
  location = "East US"
}

resource "azurerm_managed_disk" "disk" {
  name                 = "arun-disk"
  location             = azurerm_resource_group.rg3.location
  resource_group_name  = azurerm_resource_group.rg3.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 32
}

resource "azurerm_storage_account" "sa" {
  name                     = "arunstorage123456"
  resource_group_name      = azurerm_resource_group.rg3.name
  location                 = azurerm_resource_group.rg3.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "fileshare" {
  name               = "sharedfiles"
  storage_account_id = azurerm_storage_account.sa.id
  quota              = 50
}

resource "azurerm_virtual_network" "vnet" {
  name                = "arun-vnet"
  location            = azurerm_resource_group.rg3.location
  resource_group_name = azurerm_resource_group.rg3.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "arun-subnet"
  resource_group_name  = azurerm_resource_group.rg3.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "arun-nic"
  location            = azurerm_resource_group.rg3.location
  resource_group_name = azurerm_resource_group.rg3.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "arun-vm"
  location            = azurerm_resource_group.rg3.location
  resource_group_name = azurerm_resource_group.rg3.name
  size                = "Standard_B1s"

  admin_username                  = "azureuser"
  admin_password                  = "azureuser@123"
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = "arun-postgres-server123"
  resource_group_name = azurerm_resource_group.rg3.name
  location            = azurerm_resource_group.rg3.location

  administrator_login    = "pgadminuser"
  administrator_password = "Postgres@12345"

  sku_name   = "B_Standard_B1ms"
  version    = "16"
  storage_mb = 32768

  public_network_access_enabled = true
}

resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = "studentdb"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_my_ip" {
  name             = "allow-my-ip"
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = "49.37.162.6"
  end_ip_address   = "49.37.162.6"
}

output "disk_id" {
  value = azurerm_managed_disk.disk.id
}

output "fileshare_name" {
  value = azurerm_storage_share.fileshare.name
}

output "postgres_host" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}
