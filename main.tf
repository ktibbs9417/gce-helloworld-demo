provider "google" {
  credentials = file("secrets/tf-runner.json")
  project     = var.project_name
  region      = var.region_name
  zone        = var.zone_name
}

# Create Storage Bucket and upload bootstrap script within /modules/cloud-storage/webserver-bootstrap
module "hello-world-web-bootstrap-storage-bucket" {
  source = "./modules/cloud-storage"
}
# Create a single Compute Engine instance
resource "google_compute_instance" "hw_web" {
  name         = "hello-world"
  machine_type = var.lowcost_machine
  tags         = var.web_access_tags

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = var.vpc_name
    access_config {
    }
  }

  metadata = {
    startup-script-url = "https://storage.cloud.google.com/${module.hello-world-web-bootstrap-storage-bucket.hw_bootstap_bucket_name}/hw-bootstrap.sh"
  }

  service_account {
    # Use our own service account that we created
    email  = var.gce_service_account
    scopes = ["cloud-platform"]
  }
}

output "hw_web_ip" {
  value = google_compute_instance.hw_web.network_interface.0.access_config
}