# Common variables

variable "env" {
  description = "The environment to deploy resources (e.g., dev or prod)"
  type        = string
}

variable "org_id" {
  description = "The GCP organization ID"
  type        = string
}

variable "billing_id" {
  description = "The GCP billing account ID"
  type        = string
}

variable "uniform_id" {
    description = "id prefix for my cloud resume projects and resources."
    type = string
    default = "crc-mdg"
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}


###############################
variable "frontend_static_bucket" {
  description = "The name of the frontend static bucket in the dev environment"
  type        = string
  default     = "${var.env}-${var.uniform_id}-frontend-static-bucket"
}

variable "frontend_bucket_name" {
  description = "Frontend Bucket Name"
  type        = string
}

variable "backend_function_name" {
  description = "Backend Function Name"
  type        = string
}

variable "backend_function_bucket_name" {
  description = "Backend Function Bucket Name"
  type        = string
}

variable "gcsr_repo" {
  description = "GCR Repository Name"
  type        = string
}

###############################
# Development Env. Domain

variable "dev_domain_name" {
  description = "The domain name for the website in the development environment."
  type        = string
  default     = "dev.masondg-portfolio.com"
}

###############################
# Production Env. Domain
variable "domain_name" {
  description = "The domain name for the live static website in production."
  type        = string
  default     = "masondg-portfolio.com"
    
}