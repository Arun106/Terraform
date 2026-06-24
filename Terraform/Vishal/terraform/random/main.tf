resource "random_string" "random" {
  length           = var.password_length
  special          = true
  override_special = "/@£$"

  min_lower   = 3
  min_numeric = 2
  min_upper   = 2
}

output "password" {
  value = random_string.random.result
}
