locals {
  harmony = yamldecode(file("${path.module}/harmony.yaml"))["harmony"]

  execution_order = local.harmony.execution_order
  dependencies    = local.harmony.dependencies
  interconnect    = local.harmony.interconnect  
}