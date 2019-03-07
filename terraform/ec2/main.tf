resource "aws_security_group" "this" {
    name = "${var.security_name}"
    description = "${var.security_description}"

    ingress {
        protocol  = "${var.security_protocol}"
        self      = "${var.security_self}"
        from_port = "${var.security_from_port}"
        to_port   = "${var.http_security_to_port}"
        cidr_blocks = "${var.http_security_cidr_blocks}"
    }

    ingress {
        protocol  = "${var.security_protocol}"
        self      = "${var.security_self}"
        from_port = "${var.security_from_port}"
        to_port   = "${var.https_security_to_port}"
        cidr_blocks = "${var.https_security_cidr_blocks}"
    }

    ingress {
        protocol  = "${var.security_protocol}"
        self      = "${var.security_self}"
        from_port = "${var.security_from_port}"
        to_port   = "${var.ssh_security_to_port}"
        cidr_blocks = "${var.ssh_security_cidr_blocks}"
    }

    egress {
        protocol  = "${var.eg_security_protocol}"
        self      = "${var.security_self}"
        from_port = "${var.eg_security_from_port}"
        to_port   = "${var.eg_security_to_port}"
        cidr_blocks = "${var.eg_security_cidr_blocks}"
    }
}

resource "aws_key_pair" "this" {
    key_name = "${var.name_key}"
    public_key = "${file(var.public_key)}"
}

resource "aws_instance" "this" {
    ami           = "${var.instance_ami}"
    instance_type = "${var.instance_type}"   
    tags = "${var.instance_tags}"
    key_name = "${aws_key_pair.this.key_name}"
    security_groups = ["${aws_security_group.this.name}"]

    provisioner "file" {
        source = "${var.file_source}"
        destination = "${var.file_destination}"
        connection {
            type = "${var.con_type}"
            user = "${var.user}"
            private_key = "${file(var.private_key)}"
        }
    }

    provisioner "remote-exec" {
       inline = "${var.inline}"
       connection {
           type = "${var.con_type}"
           user = "${var.user}"
           private_key = "${file(var.private_key)}"
       }
    }
}
