# Combined variables.tf

# ----------------------------
# Common Variables
# ----------------------------

variable "org_id" {
  description = "The GCP organization ID"
  type        = string
}

variable "billing_id" {
  description = "The GCP billing account ID"
  type        = string
}

variable "environment" {
  description = "The environment to deploy resources (e.g., dev or prod)"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "domain_name" {
  description = "The domain name for the website"
  type        = string
  default     = "dev.masondg-portfolio.com"
}

# ----------------------------
# Development Environment Variables
# ----------------------------

variable "frontend_static_bucket" {
  description = "The name of the frontend static bucket in the dev environment"
  type        = string
  default     = "dev-crc-frontend-bucket"
}

variable "backend_function_name_dev" {
  description = "The name of the Cloud Function in the dev environment"
  type        = string
  default     = "dev-vCounter"
}

variable "backend_function_bucket_name_dev" {
  description = "The name of the bucket to store the Cloud Function code in the dev environment"
  type        = string
  default     = "dev-crc-backend-bucket"
}

variable "gcsr_repo_dev" {
  description = "The GCR repository name for the dev environment"
  type        = string
}

# ----------------------------
# Production Environment Variables
# ----------------------------

variable "project_id_prod" {
  description = "The GCP project ID for the production environment"
  type        = string
}

variable "frontend_bucket_name_prod" {
  description = "The name of the frontend bucket in the prod environment"
  type        = string
}

variable "backend_function_name_prod" {
  description = "The name of the Cloud Function in the prod environment"
  type        = string
}

variable "backend_function_bucket_name_prod" {
  description = "The name of the bucket to store the Cloud Function code in the prod environment"
  type        = string
}

variable "gcsr_repo_prod" {
  description = "The GCR repository name for the prod environment"
  type        = string
}

# ----------------------------
# Additional Variables (If Applicable)
# ----------------------------

variable "project_id_dev" {
  description = "The GCP project ID for the development environment"
  type        = string
}

# If there are any other environment-specific variables, define them here with appropriate naming conventions.
