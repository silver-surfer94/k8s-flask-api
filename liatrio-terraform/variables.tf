variable "region" {
  type    = string
  default = "us-central1"
}

variable "name" {
  type    = string
  default = "flask-api-k8s"
}

variable "description" {
  type    = string
  default = "Flask API for Kubernetes cluster"
}

variable "project_id" {
  type    = string
  default = "liatrio-kubernetes-api"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}