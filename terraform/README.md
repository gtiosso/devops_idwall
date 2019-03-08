# Terraform

## Objetivo

Criar uma Instância EC2 na AWS, com as seguintes configurações:

* **Key Pair** - Para conexões SSH;
* **Security Group** - Para definição de regras de acesso;
* **Docker** - Pré-instalado na Instância EC2;
* **Apache** - Imagem que irá rodar no Docker;

**Security Group - Regras:**        
* **Regra 1** - Permitir todas as requisições de qualquer origem para a Instância EC2 nas portas 80 e 443;
* **Regra 2** - Permitir somente _IP_ ou _Range_ específico para conectar na Instância EC2 na porta 22;

## Necessário

Você precisará de uma conta previamente cadastrada e configurada no ambiente AWS, contemplando credênciais IAM (Access_key e Secret_key);

Você precisará também dos seguintes pacotes instalados na sua máquina/servidor:

1.  Git (Para clonar este projeto);
2.  Terraform (Para orquestrar toda a criação do ambiente na AWS);
3.  SSH (Para gerar as chaves Pública/Privada para acesso via SSH);

Você pode realizar o download do Terraform [Aqui.](https://www.terraform.io/downloads.html)

## Deploy

_Instruções para o procedimento de deploy/provisionamento do ambiente AWS._

1.  Clone este projeto para sua máquina/servidor:

        $ git clone https://github.com/gtiosso/devops_idwall.git [PROJECT_FOLDER]

2.  Crie as chaves Pública/Privada para o SSH **(OBS: Por não ser ambiente produtivo, não é necessário inserir a passphrase)**:

        $ ssh-keygen

3.  Dentro da pasta terraform, execute os seguintes comando:

        $ terraform init

        $ terraform plan -var 'region=PUT A REGION' -var 'access_key=PUT YOUR ACCESS_KEY' -var 'secret_key=PUT YOUR SECRET_KEY' -var 'public_key=PUT YOUR SSH PUBLIC_KEY' -var 'private_key=PUT YOUR SSH PRIVATE_KEY' -var 'ssh_security_cidr_blocks=PUT THE IP or RANGE TO PERMIT CONNECT VIA SSH'

4.  Após a execução do "Plan" e o resultado for "OK", aplique o provisionamento:

        $ terraform apply -auto-approve -var 'region=PUT A REGION' -var 'access_key=PUT YOUR ACCESS_KEY' -var 'secret_key=PUT YOUR SECRET_KEY' -var 'public_key=PUT YOUR SSH PUBLIC_KEY' -var 'private_key=PUT YOUR SSH PRIVATE_KEY' -var 'ssh_security_cidr_blocks=PUT THE IP or RANGE TO PERMIT CONNECT VIA SSH'
       
5.  Valide a aplicação (Apache) rodando no Docker:

        http://AWS IP
        https://AWS IP
        
6.  Para destruir o ambiente, execute o comando abaixo:

        terraform destroy -auto-approve -var 'region=PUT A REGION' -var 'access_key=PUT YOUR ACCESS_KEY' -var 'secret_key=PUT YOUR SECRET_KEY' -var 'public_key=PUT YOUR SSH PUBLIC_KEY' -var 'private_key=PUT YOUR SSH PRIVATE_KEY' -var 'ssh_security_cidr_blocks=PUT THE IP or RANGE TO PERMIT CONNECT VIA SSH'

**_OBS: Os parâmetros abaixo são necessários para o funcionamento correto do deploy_**

**EXEMPLO**

* **REGION:** - 'region=us-east-1'

* **ACCESS_KEY:** - 'access_key=AJIBJCWW36S67AUCUN6Q'

* **SECRET_KEY:** - 'secret_key=2kPODSKApdoksapoDSDSksapDSADmbz2NrCfomlFzbK+/f'

* **PUBLIC_KEY:** - 'public_key=/root/.ssh/id_rsa.pub'

* **PRIVATE_KEY:** - 'private_key=/root/.ssh/id_rsa'

* **SSH_SECURITY_CIDR_BLOCKS:** - 'ssh_security_cidr_blocks=["0.0.0.0/0"]'
