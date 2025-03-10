resource "google_compute_instance" "gcp_vm" {
  for_each    = { for idx, machine in local.gcp_compute : idx => machine }
  name        = each.value.name
  machine_type = each.value.type
  zone        = each.value.zone

  boot_disk {
    initialize_params {
      image = each.value.os_image
    }
  }

  network_interface {
    network = google_compute_network.gcp_main_vpc.self_link
    access_config {}
  }

  depends_on = [google_compute_network.gcp_main_vpc]
}