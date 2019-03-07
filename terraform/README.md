# Terraform

## Objective

Create a EC2 Instance on AWS with the following configurations:

* **Key Pair** - To connect via ssh;
* **Security Group** - To protect the environment;
* **Docker** - Installed on EC2 Instance;
* **Apache** - Running on Docker;



**Security Group - Rules:**        
* **Rule 1** - Permit all requests on port 80 and 443;
* **Rule 1** - Permit only especifc _IP_ or _Range_ to connect on port 22;

## Requirements

You need a account on AWS previously created, with a user created on IAM (Access_Key and Secret_Key);

You need the following packages installed on your machine or server: 

1.  Git (To clone this project);
2.  Terraform (To provisiong entire stack on AWS);
3.  SSH (To generate public/private key and connect to EC2 Instance);

You can download Terraform [here.](https://www.terraform.io/downloads.html)

## Deploy

_Instructions to deploy entire Stack on AWS (Compose)._

1.  Clone this repository to your machine:

        $ git clone https://github.com/gtiosso/devops_idwall.git [PROJECT_FOLDER]

2.  Create SSH Public and Private Keys **(OBS: Don't need to input a passphrase)**:

        $ ssh-keygen

3.  Inside of terraform folder, run the following commands:

        $ terraform init

        $ terraform plan -var 'region=PUT A REGION' -var 'access_key=PUT YOUR ACCESS_KEY' -var 'secret_key=PUT YOUR SECRET_KEY' -var 'public_key=PUT YOUR SSH PUBLIC_KEY' -var 'private_key=PUT YOUR SSH PRIVATE_KEY' -var 'ssh_security_cidr_blocks=PUT THE IP or RANGE TO PERMIT CONNECT VIA SSH'

4.  If "Plan" command returns "OK", than apply your environment:

        $ terraform apply -auto-approve -var 'region=PUT A REGION' -var 'access_key=PUT YOUR ACCESS_KEY' -var 'secret_key=PUT YOUR SECRET_KEY' -var 'public_key=PUT YOUR SSH PUBLIC_KEY' -var 'private_key=PUT YOUR SSH PRIVATE_KEY' -var 'ssh_security_cidr_blocks=PUT THE IP or RANGE TO PERMIT CONNECT VIA SSH'
        

**EXAMPLE**

* **REGION:** - 'region=us-east-1'

* **ACCESS_KEY:** - 'access_key=AJIBJCWW36S67AUCUN6Q'

* **SECRET_KEY:** - 'secret_key=2kPODSKApdoksapoDSDSksapDSADmbz2NrCfomlFzbK+/f'

* **PUBLIC_KEY:** - 'public_key=/root/.ssh/id_rsa.pub'

* **PRIVATE_KEY:** - 'private_key=/root/.ssh/id_rsa'

* **SSH_SECURITY_CIDR_BLOCKS:** - 'ssh_security_cidr_blocks=["0.0.0.0/0"]'



5.  Access Apache (Docker) WebPage:

        http://AWS IP
        https://AWS IP

