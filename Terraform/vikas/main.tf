#BELOW IS FOR RESOURCE-GROUP

resource "azurerm_resource_group" "RG1" {

  name     = var.RG_NAME
  location = var.RG_LOCATION

}

#BELOW IS FOR NSG


resource "azurerm_network_security_group" "NSG1" {

  name                = var.NSG_NAME1
  resource_group_name = azurerm_resource_group.RG1.name
  location            = azurerm_resource_group.RG1.location

}



#BELOW IS VNET & SUBNET

resource "azurerm_virtual_network" "VNET1" {

  name                = var.VNET1.vnetname
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
  address_space       = [var.VNET1.address_space[0]]
}


resource "azurerm_subnet" "SUBNETS" {
  for_each = var.SUBNETS

  name                 = each.value.subnetname
  resource_group_name  = azurerm_resource_group.RG1.name
  virtual_network_name = azurerm_virtual_network.VNET1.name
  address_prefixes     = each.value.address_prefixes

}

#BELOW IS NIC


resource "azurerm_network_interface" "NIC" {

  name                = var.NIC.nicname
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name

  ip_configuration {

    name                          = var.NIC.ipname
    subnet_id                     = azurerm_subnet.SUBNETS["SUBNET1"].id
    private_ip_address_allocation = var.NIC.private_ip

  }
}

