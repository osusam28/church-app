output "family_api_url" {
  value = google_cloud_run_service.family_api.status[0].url
}