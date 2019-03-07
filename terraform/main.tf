provider "aws" {
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

module "instance" {
    source = "./ec2"

    ssh_security_cidr_blocks = "${var.ssh_security_cidr_blocks}"
    private_key = "${var.private_key}"
    public_key = "${var.public_key}"

    inline = [
        "sudo yum install -y *docker* epel-release",
        "sudo yum install -y python python-pip",
        "sudo pip install docker-compose",
        "sudo /etc/init.d/docker start",
        "sudo /usr/local/bin/docker-compose -f /tmp/files/compose.yml up -d"
    ]
}

