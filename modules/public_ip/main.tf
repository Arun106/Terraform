resource "terraform_data" "replace_trigger" {
  input = var.replace_trigger_value
}

resource "azurerm_public_ip" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
  lifecycle {
    replace_triggered_by = [terraform_data.replace_trigger]
  }
}
