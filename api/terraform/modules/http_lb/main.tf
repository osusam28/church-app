locals {
  backend_region_service_id = "projects/{{project}}/regions/{{region}}/backendServices/{{name}}"
}

resource "google_compute_global_address" "api_static_ip" {
  name = "rbcl-api-static-ip"
  address_type = "EXTERNAL"
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "rbcl-api-forwarding-rule"
  target     = google_compute_target_https_proxy.api_https_proxy.id
  port_range = "443"

  ip_protocol = "TCP"
  load_balancing_scheme = "EXTERNAL"
  ip_address = google_compute_global_address.api_static_ip.address
}

resource "google_compute_managed_ssl_certificate" "api_ssl_cert" {
  name = "rbcl-api-ssl-cert"

  managed {
    domains = [var.domain]
  }
}

resource "google_compute_target_https_proxy" "api_https_proxy" {
  name             = "rbcl-api-proxy"
  url_map          = google_compute_url_map.api_url_map.id
  ssl_certificates = [google_compute_managed_ssl_certificate.api_ssl_cert.id]
}

resource "google_compute_url_map" "api_url_map" {
  name        = "rbcl-api-url-map"

  default_service = local.backend_region_service_id

  default_url_redirect {
    https_redirect = var.https_redirect_flag
  }

  host_rule {
    hosts        = [var.domain]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = local.backend_region_service_id
  }
}