variable "region" {
  description = "Main Region"
}

variable "access_key" {}
variable "secret_key" {}
variable "private_key" {}
variable "public_key" {}

variable "ssh_security_cidr_blocks" {
    type = "list"
}
