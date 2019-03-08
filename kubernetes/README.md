# Kubernetes

## Objetivo

Provisionar uma aplicação em um ambiente kubernetes, com as seguintes características:

* Imagem customizada: [gtiosso1/devops-idwall:latest](https://hub.docker.com/r/gtiosso1/devops-idwall)
* Manifestos de recursos kubernetes para rodar a aplicação (deployments, services, ingress-controller, ingress, configmap...) [main.yaml](main.yaml) 
* Procedimento para deploy do ambiente.
* Validação dos Pods;
* Acesso a URL da Aplicação via Ingress;

## Requirements

Você precisará dos seguintes pacotes para realizar o processo de deploy: 

1.  Git (Para clonar este projeto);
2.  Kubectl (Para realizar o deploy de toda a Stack);
3.  Cluster Kubernetes (Para orquestrar e gerenciar todos os recursos criados);


## Deploy

_Instruções para o procedimento de Deploy._

1.  Clone este repositório para sua maquina/servidor:

        $ git clone https://github.com/gtiosso/devops_idwall.git [PROJECT_FOLDER]

2.  Dentro do diretório kubernetes, execute o seguinte comando para efetuar o deploy:

        $ kubectl apply -f main.yaml

3.  Execute os proximos comandos para validar o ambiente (Aplicação e Ingress-Controller):

        $ kubectl get pods --all-namespaces -l app=app

        $ kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx

4.  Se ambos estiverem com o status "Running", basta testar a resposta da aplicação pela url:

        http://IP_DO_NODE_KUBERNETES
        ou
        http://teste-devops.local
        
6.  Para destruir o ambiente, execute o seguinte comando:

        $ kubectl delete -f main.yaml

**OBS -** Para acessar a pagina de teste da aplicação via domínio, basta configurar o arquivo hosts da maquina de origem do teste como o **exemplo** a seguir:
*  192.168.1.100 teste-devops.local

_192.168.1.100 - IP do Node do Kubernetes_
