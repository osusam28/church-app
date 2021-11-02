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

