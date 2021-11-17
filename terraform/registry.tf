resource "google_artifact_registry_repository" "flask-api-repo" {
  provider = google-beta

  location      = var.region
  repository_id = var.name
  description   = var.description
  format        = "DOCKER"
  project       = var.project_id
}