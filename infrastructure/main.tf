# infrastructure/main.tf

terraform {
  # Configure Terraform backend to store state in GCS-admin-project
  backend "gcs" {
    bucket = "crc-tfstate-bucket"
    prefix = "admin/terraform/state"
  }
}

# Resource Definitions

# Create the "Cloud Resume Challenge" folder under the organization
resource "google_folder" "crc_folder" {
  display_name = "Cloud Resume Challenge"
  parent       = "organizations/${var.org_id}"
}

# Create the "dev" folder with parent 'crc_folder'
resource "google_folder" "dev_folder" {
  display_name = "dev"
  parent       = google_folder.crc_folder.name
}

# Create the "prod" folder with parent 'crc_folder'
resource "google_folder" "prod_folder" {
  display_name = "prod"
  parent       = google_folder.crc_folder.name
}

# Create the "frontend-dev" project in the "dev" folder
resource "google_project" "frontend_dev_project" {
  name            = "Frontend Dev Project"
  project_id      = "${var.uniform_id}-frontend-dev"
  folder_id       = google_folder.dev_folder.id
  billing_account = var.billing_id
}

# Create the "backend-dev" project in the "dev" folder
resource "google_project" "backend_dev_project" {
  name            = "Backend Dev Project"
  project_id      = "${var.uniform_id}-backend-dev"
  folder_id       = google_folder.dev_folder.id
  billing_account = var.billing_id
}

## Projects Simplified
## next simplify folders and environment

# Create the "frontend" project in the specified environment. (environment == folder for dev/prod. deploy individually and set variables according to desired env. config.)
resource "google_project" "frontend_project" {
  name            = "${var.uniform_id} Frontend ${var.env}"
  project_id      = "${var.uniform_id}-frontend-${var.env}"
  folder_id       = google_folder.prod_folder.id
  billing_account = var.billing_id
}

# Create the "backend-prod" project in the "prod" folder
resource "google_project" "backend_project" {
  name            = "${var.uniform_id} Backend ${var.env}"
  project_id      = "${var.uniform_id}-backend-${var.env}"
  folder_id       = google_folder.prod_folder.id
  billing_account = var.billing_id
}

# ----------------------------
# Data Sources
# ----------------------------

# Access the remote state from the admin environment
data "terraform_remote_state" "admin" {
  backend = "gcs"
  config = {
    bucket = "crc-tfstate-bucket"  # Same bucket as in admin's backend
    prefix = "admin/terraform/state"
  }
}

# ----------------------------
# Module Definitions
# ----------------------------

# Dev Environment Modules
module "frontend_dev" {
  source = "../../modules/frontend"

  project_id         = google_project.frontend_dev_project.project_id
  region             = var.region
  gcs_static_bucket  = var.frontend_static_bucket
  domain_name        = var.domain_name
  environment        = var.env
}

module "backend_dev" {
  source = "../../modules/backend"

  project_id                = google_project.backend_dev_project.project_id
  project_number_serviceacc = data.terraform_remote_state.admin.outputs.servicacc_pnum_dev
  region                    = var.region
  function_name             = var.backend_function_name
  repo_name                 = var.gcsr_repo
}

# Prod Environment Modules
module "frontend_prod" {
  source = "../../modules/frontend"

  project_id    = google_project.frontend_prod_project.project_id
  region        = var.region
  bucket_name   = var.frontend_bucket_name
  domain_name   = var.domain_name
  environment   = var.env
}

module "backend_prod" {
  source = "../../modules/backend"

  project_id            = google_project.backend_prod_project.project_id
  region                = var.region
  function_name         = var.backend_function_name
  function_bucket_name  = var.backend_function_bucket_name
}
