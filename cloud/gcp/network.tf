resource "google_compute_network" "gcp_main_vpc" {
  name                    = local.gcp_network.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "gcp_subnet" {
  for_each      = { for subnet in local.gcp_network.subnets : subnet.name => subnet }
  name          = each.value.name
  network       = google_compute_network.gcp_main_vpc.self_link
  region        = each.value.region
  ip_cidr_range = each.value.ip_cidr_range
}
resource "google_compute_network" "gcp_network" {
  name                    = local.gcp_network.network_name
  auto_create_subnetworks = false
}