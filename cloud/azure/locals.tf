locals {
  azure_network = yamldecode(file("${path.module}/network.yaml"))["azure_network"]
  azure_storage = yamldecode(file("${path.module}/storage.yaml"))["azure_storage"]
  azure_vm      = yamldecode(file("${path.module}/vm.yaml"))["azure_vm"]
}