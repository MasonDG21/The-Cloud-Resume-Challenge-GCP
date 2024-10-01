# infrastructure/variables.tf

variable "env" {
  description = "The environment to deploy resources (e.g., dev / staging / prod)"
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
    description = "uniform structure for identifying my resources and their associations."
    type = string
    default = "mdg-crc"
}

variable "uniform_name" {
    description = "Uniform naming structure for identifying projects and their associated resources."
    type = string
    default = "MDG CRC"
}

variable "region" {
  description = "The GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "domain_name" {
  description = "The domain name for the website"
  type        = string
  default     = (var.env == "prod" ? "www.masondg-portfolio.com" : "dev.masondg-portfolio.com")
}


###############################
variable "frontend_static_bucket" {
  description = "The name of the frontend static bucket to serve the website content."
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