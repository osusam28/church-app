resource "google_api_gateway_api" "rbcl_api_gw" {
  provider = google-beta
  api_id = var.rbcl_api_name
}

resource "google_api_gateway_api_config" "rbcl_api_gw" {
  provider = google-beta
  api = google_api_gateway_api.rbcl_api_gw.api_id
  api_config_id_prefix = "${var.rbcl_api_config_name}-"

  openapi_documents {
    document {
      path = "${path.module}/gateway.yaml"
      contents = base64encode(
        templatefile(
          "${path.module}/gateway.yaml",
          {
            family_api_url = var.family_api_url
            account_name   = var.auth0_account_name
          }
        )
      )
    }
  }
  gateway_config {
    backend_config {
        google_service_account = var.deploy_sa_email
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_api_gateway_gateway" "rbcl_api_gw" {
  provider = google-beta
  api_config = google_api_gateway_api_config.rbcl_api_gw.id
  gateway_id = var.rbc_api_gw_name
}