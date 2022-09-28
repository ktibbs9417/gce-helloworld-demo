# Compute Engine machine type
lowcost_machine = "e2-small"

# Make Compute Engine accessible through HTTP/S
web_access_tags = ["http-server", "https-server"]

# Name of project to execute on
project_name = "korey-sandbox-359522"

# Name of region
region_name = "us-west2"

# Name of zone
zone_name = "us-west2-b"

# VPC Name to use
vpc_name = "sandbox-vpc"

# Metadata for Web GCE instances
# web_gce_metadata = "https://storage.cloud.google.com/${module.hello-world-web-bootstrap-storage-bucket.hw_bootstap_bucket_name}/hw-bootstap.sh"

# GCE Service account
gce_service_account = "terraform-executor@korey-sandbox-359522.iam.gserviceaccount.com"