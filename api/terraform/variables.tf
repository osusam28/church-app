variable "project" {
  
}

variable "region" {
  
}

variable "deploy_sa_email" {
  description = "The service account email used to deploy resources"
}

variable "domain" {
  description = "API domain url"
}

variable "https_redirect_flag" {
  description = "If true, redirect external http calls to https using the load balancer setup"
}

variable "rbcl_api_name" {
  
}

variable "rbcl_api_config_name" {
  
}

variable "rbc_api_gw_name" {
  
}

variable "family_api_name" {
  
}

variable "family_api_image_url" {
  
}