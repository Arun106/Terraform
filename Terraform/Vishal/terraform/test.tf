resource "local_file" "testfile" {
  filename = "abc.txt"
  content  = "this is my second resource and correcting some details"
}
resource "local_file" "testfile1" {
  filename = "abc1.txt"
  content  = "this is my second resource and correcting some details"
}
resource "local_file" "testfile2" {
  filename = "abc2.txt"
  content  = "this is my second resource and correcting some details"
}
