output "hw_web_ip" {
  value = google_compute_instance.hw_web.network_interface.0.access_config
}
