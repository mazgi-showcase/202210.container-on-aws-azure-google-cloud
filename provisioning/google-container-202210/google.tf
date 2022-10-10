resource "google_project_service" "services" {
  for_each = toset([
    "cloudresourcemanager",
    "run",
  ])
  service            = "${each.key}.googleapis.com"
  disable_on_destroy = false
}
