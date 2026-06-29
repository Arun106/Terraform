resource "azurerm_resource_group" "pg_rg" {
  name     = "arun-postgres-rg"
  location = "Japan East"
}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = "arun-postgres-japan2026"
  resource_group_name = azurerm_resource_group.pg_rg.name
  location            = azurerm_resource_group.pg_rg.location

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

output "postgres_host" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}
