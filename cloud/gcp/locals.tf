locals {
  gcp_network  = yamldecode(file("${path.module}/network.yaml"))["gcp_network"]
  gcp_storage  = yamldecode(file("${path.module}/storage.yaml"))["gcp_storage"]
  gcp_compute  = yamldecode(file("${path.module}/compute.yaml"))["gcp_compute"]
}