provider "google" {
  region  = var.gcp_region
  project = var.gcp_project_id
}

resource "google_compute_instance" "web" {
  name         = "gcp-web"
  machine_type = var.gcp_machine_type
  zone         = "${var.gcp_region}-a"

  tags = ["web"]

  boot_disk {
    initialize_params { image = "debian-cloud/debian-11" }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "terraform:${var.ssh_public_key}"
  }

  metadata_startup_script = templatefile("${path.module}/healthcheck.tpl", {
    port    = 80
    backend = "GCP"
  })
}