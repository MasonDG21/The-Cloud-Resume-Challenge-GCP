# Combined outputs.tf

# ----------------------------
# Admin Outputs
# ----------------------------

# For DEV
output "frontend_pid_dev" {
  description = "The GCP Project ID for the frontend dev project"
  value       = google_project.frontend_dev_project.project_id
}

output "backend_pid_dev" {
  description = "The GCP Project ID for the backend dev project"
  value       = google_project.backend_dev_project.project_id
}

output "servicacc_pnum_dev" {
  description = "The GCP project number for the backend dev project"
  value       = google_project.backend_dev_project.number
}

# For PRODUCTION
output "frontend_pid_prod" {
  description = "The GCP Project ID for the production frontend project"
  value       = google_project.frontend_prod_project.project_id
}

output "backend_pid_prod" {
  description = "The GCP Project ID for the production backend project"
  value       = google_project.backend_prod_project.project_id
}

output "servicacc_pnum_prod" {
  description = "The GCP project number for the backend prod project"
  value       = google_project.backend_prod_project.number
}

# ----------------------------
# Environment (Dev) Outputs
# ----------------------------

output "frontend_static_bucket" {
  description = "The name of the frontend bucket"
  value       = module.frontend_dev.gcs_static_bucket
}

output "frontend_bucket_url" {
  description = "The URL of the frontend bucket"
  value       = module.frontend_dev.bucket_url
}

output "frontend_load_balancer_ip" {
  description = "The IP address of the load balancer"
  value       = module.frontend_dev.load_balancer_ip
}

output "backend_function_url" {
  description = "The URL of the Cloud Function"
  value       = module.backend_dev.function_url
}

# ----------------------------
# (Optional) Environment (Prod) Outputs
# ----------------------------

# If you have similar outputs for the production environment, you can include them here.
# For example:

output "frontend_static_bucket_prod" {
  description = "The name of the production frontend bucket"
  value       = module.frontend_prod.gcs_static_bucket
}

output "frontend_bucket_url_prod" {
  description = "The URL of the production frontend bucket"
  value       = module.frontend_prod.bucket_url
}

output "frontend_load_balancer_ip_prod" {
  description = "The IP address of the production load balancer"
  value       = module.frontend_prod.load_balancer_ip
}

output "backend_function_url_prod" {
  description = "The URL of the production Cloud Function"
  value       = module.backend_prod.function_url
}
