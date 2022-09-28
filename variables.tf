variable "lowcost_machine" {
  type        = string
  description = "Machine type that is of low cost"
}

variable "web_access_tags" {
  type        = list(any)
  description = "Tags used to make web instances accessible over http and https"
}

variable "project_name" {
  type = string
}

variable "region_name" {
  type = string
}

variable "zone_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

# variable "web_gce_metadata" {
#   type = string
# }

variable "gce_service_account" {
  type = string
}