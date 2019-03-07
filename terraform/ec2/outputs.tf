output "instance" {
    value = "${aws_instance.this.public_ip}"
}
