resource "azurerm_resource_group" "rg_vnet" {
  name     = local.vnet_resource_group_name
  location = var.location

  tags = var.tags
}

# vnet
module "vnet" {
  source              = "git::https://github.com/pagopa/azurerm.git//virtual_network?ref=v2.18.7"
  name                = local.vnet_name
  location            = azurerm_resource_group.rg_vnet.location
  resource_group_name = azurerm_resource_group.rg_vnet.name
  address_space       = var.cidr_vnet

  tags = var.tags
}
