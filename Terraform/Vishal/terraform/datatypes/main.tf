resource "local_file" "testfile1" {
  filename = var.filename1

  content = var.content
}
resource "local_file" "testfile2" {
  filename = var.filename2
  content  = var.content
}
resource "local_file" "testfile3" {
  filename = var.filename3

  content = var.content
}
resource "local_file" "testfile4" {
  filename = var.filename4
  content  = var.content
}
resource "local_file" "testfilel1" {
  filename = var.filenamel1[3]
  content  = var.content
}

resource "local_file" "testfilel2" {
  filename = var.filenamel2[1]
  content  = var.content
}

resource "local_file" "testfilel3" {
  filename = var.filenamel3[0][2]
  content  = var.content
}

