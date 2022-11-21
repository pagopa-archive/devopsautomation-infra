resource "azurerm_resource_group" "rg_docker" {
  name     = local.docker_rg_name
  location = var.location
  tags     = var.tags
}

#
# 📦 ACR
#
module "container_registry" {
  source                        = "git::https://github.com/pagopa/azurerm.git//container_registry?ref=v2.18.7"
  name                          = local.docker_registry_name
  resource_group_name           = azurerm_resource_group.rg_docker.name
  location                      = azurerm_resource_group.rg_docker.location
  sku                           = "Basic"
  admin_enabled                 = true # TODO to change ...
  anonymous_pull_enabled        = false
  zone_redundancy_enabled       = false
  public_network_access_enabled = true

  private_endpoint = {
    enabled              = false
    private_dns_zone_ids = []
    subnet_id            = null
    virtual_network_id   = null
  }

  network_rule_set = [{
    default_action  = "Allow"
    ip_rule         = []
    virtual_network = []
  }]

  tags = var.tags
}
