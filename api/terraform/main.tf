provider "google" {
  project = var.project
  region = var.region
}

provider "google-beta" {
  project = var.project
  region = var.region
}

terraform {
  backend "gcs" {
    bucket  = "rbc-louisville-project.appspot.com"
    prefix  = "terraform/state/church-app/api"
  }
}

