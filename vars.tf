variable "host_domain" {
  type = "string"
  #default = "gregmilligaphotography.com"
}

variable "record_type" {
  default = "A"
  type = "string"
}

variable "ttl" {
  type = "string"
}

variable "endpoint" {
  type = "string"
}

variable "application" {
  type = "string"
}

variable "environment" {
  type = "string"
}

variable "zone" {
  type = "string"
}

# variable "public_ip" {
#   type = "string"
# }
#
# variable "public_dns" {
#   type = "string"
# }
