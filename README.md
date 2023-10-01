<div align="center">

 <img src="https://www.turbogeek.co.uk/wp-content/uploads/2023/02/Terraform-1329545833434920628.png" alt="Logo do Terraform" width="25%" />

 
 # Terraform with Minikube
 
</div>

Este repositório contém os arquivos do esqueleto (modelo) para iniciar experimentos com o Terraform usando os providers do Kubernetes e Helm.

## Requisitos

Antes de começar, certifique-se de que você tenha os seguintes requisitos instalados:

- Docker: Siga as etapas mencionadas na documentação oficial para [instalar o Docker](https://docs.docker.com/get-docker/).

- Minikube: Siga as etapas mencionadas na documentação oficial para [instalar o Minikube](https://minikube.sigs.k8s.io/docs/start/).

- CLI do Terraform: Siga as etapas mencionadas na documentação oficial para [instalar a CLI do Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).

## Etapas

Aqui estão as principais etapas para iniciar e realizar experimentos com as configurações no Kubernetes usando Terraform e Helm:

### Passo 1: Iniciar o Cluster Minikube

Use o seguinte comando para iniciar o cluster Minikube localmente:

```shell
minikube start
```

### Etapa 2: Código no Terraform

O código Terraform usado nesta demonstração está organizado em vários arquivos para seguir as melhores práticas:

- `providers.tf`: Este arquivo contém detalhes sobre os módulos do provedor HashiCorp Terraform que usaremos. Você pode personalizar os provedores necessários aqui.
- `k8s.tf`: Este é o arquivo principal onde declararemos nossos recursos Kubernetes usando Terraform.
- `helm.tf`: Este é o arquivo principal onde declararemos nossos recursos Kubernetes usando Helm.

### Etapa 3: Executar o código do Terraform para criar recursos

Nesta etapa, estaremos executando os seguintes comandos Terraform para criar os recursos no cluster Minikube:

```shell
terraform init
terraform plan
terraform apply
```

### Etapa 4: Verificar os recursos no Kubernetes

Após a execução bem-sucedida do código Terraform, você pode verificar os recursos criados no Kubernetes usando os comandos Kubernetes padrão, como `kubectl get pods`, `kubectl get services`.

### Etapa 5: Limpar recursos de demonstração

Quando você terminar seus experimentos e quiser limpar os recursos implantados, você pode executar o seguinte comando Terraform:

```shell
terraform destroy
```

Isso removerá todos os recursos criados na etapa 3. Lembre-se de personalizar e adaptar os arquivos Terraform de acordo com seus requisitos específicos antes de executar as etapas acima.

## Changelog

Por favor, veja [CHANGELOG](CHANGELOG.md) para obter mais informações sobre o que mudou recentemente.

## Seja um dos contribuidores

Sinta-se à vontade para contribuir com melhorias, correções de bugs ou adicionar recursos a este repositório. Basta criar um fork do projeto, fazer as alterações e enviar um pull request. Suas contribuições serão bem-vindas!

Quer fazer parte desse projeto? leia [como contribuir](CONTRIBUTING.md).

## Licença

Este projeto é licenciado sob a Licença MIT. Veja o arquivo [LICENÇA](LICENSE) para mais detalhes.