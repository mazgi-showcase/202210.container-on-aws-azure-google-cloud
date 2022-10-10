resource "google_cloud_run_service" "main" {
  name     = "${var.project_unique_id}-main"
  location = var.gcp_default_region
  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = 1
      }
    }
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
        resources {
          limits = {
            "cpu"    = 1
            "memory" = "128Mi"
          }
        }
      }
    }
  }
  depends_on = [
    google_project_service.services
  ]
}

resource "google_cloud_run_service_iam_policy" "main-noauth" {
  location    = google_cloud_run_service.main.location
  project     = google_cloud_run_service.main.project
  service     = google_cloud_run_service.main.name
  policy_data = data.google_iam_policy.noauth.policy_data
}
