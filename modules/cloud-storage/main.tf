terraform {
  required_version = ">= 1.3.0"
}

resource "random_pet" "pet_name" {
  length = 1
}

resource "random_string" "two_alphanumeric" {
  length  = 2
  special = false
  upper   = false
}

# Create storage bucket in US region
resource "google_storage_bucket" "hw_bootstap" {
  name                        = "${random_pet.pet_name.id}_bs-scripts_${random_string.two_alphanumeric.result}"
  location                    = "US"
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "bootstrap_script" {
  name = "hw-bootstrap.sh"
  content = file("./modules/cloud-storage/webserver-bootstrap/hw-bootstrap.sh")
  bucket = google_storage_bucket.hw_bootstap.name
}