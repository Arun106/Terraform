output "username" {
  value = "${var.prefix}-${random_string.user_id.result}"
}
