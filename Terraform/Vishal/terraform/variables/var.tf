variable "filename" {
  default = "abc.txt"
}
variable "content" {
  default = "My name is vishal"
}
variable "filename1" {
  default = "abc2.txt"
}
output "fid" {
  value = local_file.testfile.id
}
locals {
  filename = "test123.txt"
  content  = "inside locals"
}



