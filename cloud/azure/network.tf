resource "azurerm_virtual_network" "azure_vnet" {
  name                = local.azure_network.vnet_name
  location            = local.azure_network.location
  resource_group_name = local.azure_network.resource_group_name
  address_space       = local.azure_network.address_space
}

resource "azurerm_subnet" "azure_subnet" {
  for_each            = { for subnet in local.azure_network.subnets : subnet.name => subnet }
  name                = each.value.name
  resource_group_name = local.azure_network.resource_group_name
  virtual_network_name = azurerm_virtual_network.azure_vnet.name
  address_prefixes     = [each.value.address_prefix]
}