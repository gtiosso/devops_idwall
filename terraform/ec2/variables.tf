### INSTANCE VARIABLES ###
variable "instance_ami" {
    default = "ami-0080e4c5bc078760e"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "instance_tags" {
    type = "map"
    default = {
        "Name" = "idwall_instance_docker"
    }
}

### PROVISINER REMOTE EXEC & FILE VARIABLES ###
variable "con_type" {
    default = "ssh"
}

variable "user" {
    default = "ec2-user"
}

variable "private_key" {}

variable "inline" {
    type = "list"
    default = []
}

variable "file_source" {
    default = "files"
}

variable "file_destination" {
    default = "/tmp"
}

### KEY PAIR VARIABLES ###
variable "public_key" {}

variable "name_key" {
    default = "idwall_teste_key"
}

### SECURITY GROUP VARIABLES ###
variable "security_name" {
    default = "idwall_teste_security"
}

variable "security_description" {
    default = "IDWALL Teste Security Group"
}

variable "security_protocol" {
    default = "tcp"
}

variable "security_self" {
    default = true
}

variable "security_from_port" {
    default = "0"
}

variable "http_security_to_port" {
    default = 80
}

variable "http_security_cidr_blocks" {
    type = "list"
    default = ["0.0.0.0/0"]
}

variable "https_security_to_port" {
    default = 443
}

variable "https_security_cidr_blocks" {
    type = "list"
    default = ["0.0.0.0/0"]
}

variable "ssh_security_to_port" {
    default = 22
}

variable "ssh_security_cidr_blocks" {
    type = "list"
}

variable "eg_security_protocol" {
    default = "-1"
}

variable "eg_security_from_port" {
    default = "0"
}

variable "eg_security_to_port" {
    default = "0"
}

variable "eg_security_cidr_blocks" {
    type = "list"
    default = ["0.0.0.0/0"]
}
