resource "azurerm_network_interface" "azure_nic" {
  for_each            = { for vm in local.azure_vm : vm.name => vm }
  name                = "${each.value.name}-nic"
  location            = each.value.region
  resource_group_name = "Terraform-Group"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.azure_subnet[each.value.subnet].id  # ✅ Correction ici
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "azure_vm" {
  for_each            = { for vm in local.azure_vm : vm.name => vm }
  name                = each.value.name
  location            = each.value.region
  resource_group_name = "Terraform-Group"
  vm_size             = each.value.size

  network_interface_ids = [azurerm_network_interface.azure_nic[each.key].id]

  storage_os_disk {
    name              = "${each.value.name}-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  depends_on = [azurerm_storage_account.azure_storage]
}