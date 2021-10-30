/*
resource "google_compute_region_network_endpoint_group" "api_backend" {
  name                  = "rbcl-api-backend-${each.key}"
  network_endpoint_type = "SERVERLESS"
  region                = data.google_cloud_run_service.api_service[each.key].location
  cloud_run {
    service = data.google_cloud_run_service.api_service.name
  }
}

data "google_cloud_run_service" "api_service" {
  name      = each.key
  location  = each.value["location"]
}
*/