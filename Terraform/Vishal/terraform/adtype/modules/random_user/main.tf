resource "random_string" "user_id" {
  length  = var.length
  special = false
}
