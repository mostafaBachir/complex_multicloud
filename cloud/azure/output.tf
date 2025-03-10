output "vnet_id" {
  value = azurerm_virtual_network.azure_vnet.id
}

output "subnet_ids" {
  value = { for k, v in azurerm_subnet.azure_subnet : k => v.id }
}

output "storage_account_names" {
  value = { for k, v in azurerm_storage_account.azure_storage : k => v.name }
}

output "vm_names" {
  value = { for k, v in azurerm_virtual_machine.azure_vm : k => v.name }
}