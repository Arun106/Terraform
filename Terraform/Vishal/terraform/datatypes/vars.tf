variable "filename1" {
  default = "abc.txt"
  type    = string
}
variable "filename2" {
  default = "abc.txt"
  type    = string
}
variable "filename3" {
  default = "abc.txt"
  type    = string
}
variable "filename4" {
  default = "abc.txt"
  type    = string
}
variable "content" {
  default = "hello world"
}
variable "filenamel1" {
  default = ["adi", 123, true, "adi", "abc"]
  type    = list(any)
}
variable "filenamel2" {
  default = [1, 2, 3]
  type    = list(number)
}
variable "filenamel3" {
  default = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  type    = list(list(number))
}

