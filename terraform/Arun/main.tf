module "resource_group" {
  source = "./modules/resource_group"

  name     = var.rg_name
  location = var.location
}

module "vnet" {
  source = "./modules/vnet"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  vnet_name           = var.vnet_name
  address             = var.address

  depends_on = [module.resource_group]
}

module "public_ip" {
  source = "./modules/public_ip"

  name                = var.public_ip_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku

  depends_on = [module.resource_group]
}

module "storage_account" {
  source = "./modules/storage_account"

  storage_account_name     = var.storage_account_name
  resource_group_name      = module.resource_group.name
  location                 = module.resource_group.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  depends_on = [module.resource_group]
}
