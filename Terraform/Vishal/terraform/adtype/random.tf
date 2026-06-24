resource "random_string" "password" {
  length = 12
}

output "random_password" {
  value = random_string.password.result
}
resource "random_integer" "port" {
  min = 1000
  max = 9999
}

output "random_port" {
  value = random_integer.port.result
}
variable "enable_logging" {
  default = true
}

output "logging_status" {
  value = var.enable_logging
}


resource "random_string" "application_name" {
  length = 6
}

variable "default_port" {
  type    = number
  default = 8080
}

locals {
  application_config = {
    app_name = random_string.application_name.result
    port     = var.default_port
  }
}

output "map_output" {
  value = local.application_config
}





resource "random_string" "database_identifier" {
  length = 8
}

variable "db_port" {
  type    = number
  default = 5432
}

variable "db_enabled" {
  type    = bool
  default = true
}

locals {
  database_details = {
    name    = random_string.database_identifier.result
    port    = var.db_port
    enabled = var.db_enabled
  }
}

output "object_output" {
  value = local.database_details
}
