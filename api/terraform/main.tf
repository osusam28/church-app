provider "google" {
  project = var.project
  region  = var.region
}

provider "google-beta" {
  project = var.project
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket  = "rbc-louisville-project.appspot.com"
    prefix  = "terraform/state/church-app/api"
  }
}

module "apps" {
  source               = "./modules/apps"
  region               = var.region
  family_api_name      = var.family_api_name
  family_api_image_url = var.family_api_image_url
}

module "gateway" {
  source               = "./modules/gateway"
  deploy_sa_email      = var.deploy_sa_email
  rbcl_api_name        = var.rbcl_api_name
  rbcl_api_config_name = var.rbcl_api_config_name
  rbc_api_gw_name      = var.rbc_api_gw_name
  family_api_url       = module.apps.family_api_url
}

