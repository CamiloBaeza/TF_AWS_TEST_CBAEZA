variable "project" {
  type        = string
  description = "Project Name"
}
variable "region" {
  type        = map(string)
  description = "AWS Region"
}