# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke"
  location = var.region

  initial_node_count = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

# Ideally create a separately managed node pool, but it takes too long
#resource "google_container_node_pool" "primary_nodes" {
#  name       = "${google_container_cluster.primary.name}-node-pool"
#  location   = var.region
#  cluster    = google_container_cluster.primary.name
#  node_count = var.gke_num_nodes
#
#  node_config {
#    # Added default scopes for GKE to allow GCR pulling
#    oauth_scopes = [
#      "https://www.googleapis.com/auth/logging.write",
#      "https://www.googleapis.com/auth/monitoring",
#      "https://www.googleapis.com/auth/devstorage.read_only",
#      "https://www.googleapis.com/auth/service.management.readonly",
#      "https://www.googleapis.com/auth/servicecontrol",
#      "https://www.googleapis.com/auth/trace.append"
#    ]
#
#    labels = {
#      env = var.project_id
#    }
#
#    # preemptible  = true
#    machine_type = "n1-standard-1"
#    tags         = ["gke-node", "${var.project_id}-gke"]
#    metadata = {
#      disable-legacy-endpoints = "true"
#    }
#  }
#}
#
#
