resource "google_storage_bucket" "gcp_bucket" {
  for_each = { for idx, bucket in local.gcp_storage : idx => bucket }
  name     = each.value.name
  location = each.value.location
  storage_class = each.value.storage_class
}