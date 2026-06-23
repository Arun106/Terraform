output "resource_group_name" {
  value = module.resource_group.name
}

output "resource_group_id" {
  value = module.resource_group.id
}

output "vnet_name" {
  value = module.vnet.vnet_names
}

output "vnet_id" {
  value = module.vnet.vnet_name_id_map
}

output "public_ip_name" {
  value = module.public_ip.name
}

output "public_ip_id" {
  value = module.public_ip.public_ip_id
}

output "public_ip_address" {
  value = module.public_ip.public_ip_address
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}
