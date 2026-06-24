resource "local_file" "testfile4" {
  filename = "abc4.txt"
  content = "correcting some details"
}
resource "local_file" "testfile5" {
  filename = "abc5.txt"
  content  = "this is second resource and correcting some details"
}
resource "local_file" "testfile6" {
  filename = "abc6.txt"
  content  = "this is my resource and correcting some details"
}
resource "local_file" "testfile7" {
  filename = "abc7.txt"
  content = "correcting some details"
}
resource "local_file" "testfile8" {
  filename = "abc8.txt"
  content  = "this is second resource and correcting some details"
}
resource "local_file" "testfile9" {
  filename = "abc9.txt"
  content  = "this is my resource and correcting some details"
}

