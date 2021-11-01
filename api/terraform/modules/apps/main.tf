resource "google_cloud_run_service" "family_api" {
  name     = var.family_api_name
  location = var.region

  template {
    spec {
      containers {
        image = var.family_api_image_url
        ports {
          container_port = 80
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}