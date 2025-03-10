resource "azurerm_storage_account" "azure_storage" {
  for_each            = { for bucket in local.azure_storage : bucket.name => bucket }
  name                = each.value.name
  location            = "East US"
  resource_group_name = each.value.resource_group_name
  account_tier        = each.value.account_tier
  account_replication_type = each.value.replication
}