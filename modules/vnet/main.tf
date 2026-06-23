resource "azurerm_virtual_network" "vnet" {
  count = length(var.vnet_name)

  name                = var.vnet_name[count.index]
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.address[count.index]]
}
