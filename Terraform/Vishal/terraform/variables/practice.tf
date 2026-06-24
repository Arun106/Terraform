resource "local_file" "testfile" {
  filename = var.filename
  content  = var.content
}
resource "local_file" "testfile2" {
  filename = var.filename1
  content  = var.content
}
resource "local_file" "testfile3" {
  filename = local.filename
  content  = local.content
}


