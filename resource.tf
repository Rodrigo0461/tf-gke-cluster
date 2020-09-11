resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "${var.region}"
  project  = "${var.project}"

 
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = "" 

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary" {
  name       = "${var.node_pool["${var.env}"]}"
  location   = "${var.region}"
  project    = "${var.project}"
  cluster    = google_container_cluster.primary.name
  node_count = "${var.node_count["${var.env}"]}"

  node_config {
    preemptible  = false
    machine_type = "${var.machine_type["${var.env}"]}"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}