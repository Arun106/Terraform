output "vnet_names" {
  value = azurerm_virtual_network.vnet[*].name
}

output "vnet_ids" {
  value = azurerm_virtual_network.vnet[*].id
}

output "vnet_name_id_map" {
  value = {
    for vnet in azurerm_virtual_network.vnet :
    vnet.name => vnet.id
  }
}
