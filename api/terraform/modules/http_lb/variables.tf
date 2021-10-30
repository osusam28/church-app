variable "domain" {
    description = "The api root domain"
    type        = string
}

variable "https_redirect_flag" {
    description = "Set to true if http should be redirected to https"
    type        = bool
}
