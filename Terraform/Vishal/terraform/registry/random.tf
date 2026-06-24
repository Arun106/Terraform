resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
min_lower = 3
min_numeric = 2
min_upper = 2
}

