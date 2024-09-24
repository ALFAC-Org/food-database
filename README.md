# Infraestrutura de banco de dados - ALFAC

Este é um repositório Git que utiliza o Terraform para gerenciar infraestrutura do banco de dados da aplicação [Fast Food - ALFAC](https://github.com/ALFAC-Org/food). Nele, você encontrará arquivos de configuração do Terraform que definem a infraestrutura do banco de dados como código. No momento, o repositório está focado na Amazon Web Services (AWS), usando o RDS. Entretanto, o repositório é flexível para adaptação para outros provedores de banco de dados.

> [!WARNING]  
> **Para completo funcionamento do sistema, é necessário seguir todo o fluxo de provisionamento: 1. A provisão do repositório de infraestrutura [https://github.com/ALFAC-Org/food-cloud-infra](https://github.com/ALFAC-Org/food-cloud-infra); 2. a provisão deste repositório; 3. A provisão das lambdas [https://github.com/ALFAC-Org/food-serveless-function](https://github.com/ALFAC-Org/food-serveless-function); 4. E por fim, a o provionamento da aplicação principal, utilizando de todos os recursos anteriormente criados em [https://github.com/ALFAC-Org/food](https://github.com/ALFAC-Org/food)**

![passos-seguir](./docs/passos.png)

## Conceito

O banco de dados escolhido para essa aplicação foi o MySql, devido ao seu modelo relacional. Entenda motivos para esta escolha a seguir.

### Razões para usar um banco relacional (MySql)

- Estrutura de dados bem definida e com suporte a chaves estrangeiras. Isso permite garantirmos a consistência dos dados, como por exemplo, um pedido deve estar sempre associado a um cliente válido.
- A estrutura relacional facilita o gerenciamento de relacionamentos complexos entre diferentes entidades, como por exemplo, entre clientes, pedidos, itens e pagamentos.
- Alterações na estrutura dos dados, como adicionar novas colunas ou modificar os relacionamentos entre as tabelas, podem ser realizadas de forma controlada e com menor risco para o sistema.
- Embora a escalabilidade horizontal não seja uma opção, ainda podemos explorar a escalabilidade vertical. Além disso, para atender a necessidades futuras, poderíamos considerar a utilização de um banco de dados chave-valor com persistência em memória, como o Redis. Esse banco poderia ser usado para armazenar o catálogo de produtos em cache, permitindo que as consultas sejam direcionadas primariamente para ele, o que ajudaria a melhorar a performance do sistema.

### MER

TODO

## Como rodar o projeto

Existem duas formas com as quais você pode ver esse repositório em ação:

- **Via GitHub Actions (recomendada)**
- Localmente

### Via GitHub Actions (recomendada)


<details>
  <summary>Passo a passo</summary>

1. Acesse [https://github.com/ALFAC-Org/food-database/actions](https://github.com/ALFAC-Org/food-database/actions) (A guia `Actions` deste repositório);
2. Acesse `AWS - Cria infraestrutura do banco de dados`;
3. Clique em `Run workflow` (ou Executar workflow);
4. Aguarde. Se tudo der certo, o `check` verde deverá aparecer - o processo dura em torno de 2 a 5 minutos;
   1. ![infra-criada-sucesso](./docs/infra-criada-db-sucesso.png)
   2. ![infra-criada-sucesso-output](./docs/infra-criada-sucesso-db.png)

</details>

### Localmente

<details>
  <summary>Passo a passo</summary>

#### Pré-requisitos

Antes de começar, certifique-se de ter os seguintes itens instalados e configurados em seu ambiente:

1. **Terraform**: A ferramenta que permite definir, visualizar e implantar a infraestrutura de nuvem.
2. **AWS CLI**: A interface de linha de comando da AWS.
3. **Credenciais AWS válidas**: Você precisará de uma chave de acesso e uma chave secreta para autenticar com a AWS (no momento, o repositório usa chaves e credenciais fornecidas pelo [AWS Academy](https://awsacademy.instructure.com/) e que divergem de contas padrão).

## Como usar

1. **Clone este repositório**:

```bash
git clone https://github.com/ALFAC-Org/food-database
```

2. **Acesse o diretório do repositório**:

```bash
cd food-database
```

3. **Configure as credenciais AWS em seu ambiente**:

```bash
aws configure
```

4. Defina as variáveis necessárias ao nível de ambiente, via arquivo `.tfvars` ou passe através dos comandos. Exemplo:

```bash
terraform <comando> <parâmetros> \
-var "aws_region=$AWS_REGION" \
-var "arn_aws_lab_role=$ARN_AWS_LAB_ROLE" \
-var "vpc_id=$VPC_ID" \
-var "subnet_database_1_cidr_block=$SUBNET_DATABASE_1_CIDR_BLOCK" \
-var "subnet_database_2_cidr_block=$SUBNET_DATABASE_2_CIDR_BLOCK" \
-var "subnet_availability_zone_az_1=$SUBNET_AVAILABILITY_ZONE_AZ_1" \
-var "subnet_availability_zone_az_2=$SUBNET_AVAILABILITY_ZONE_AZ_2" \
-var "db_username=$DB_USERNAME" \
-var "db_password=$DB_PASSWORD" \
-var "db_identifier=$DB_IDENTIFIER" \
-var "db_name=$DB_NAME" \
-var "lambda_sg_id=$LAMBDA_SG_ID" \
-var "cluster_sg_id=$CLUSTER_SG_ID"
```

1. **Inicialize o diretório Terraform**:

```bash
terraform init
```

5. **Visualize as mudanças que serão feitas**:

```bash
terraform plan \
-var "aws_region=$AWS_REGION" \
-var "arn_aws_lab_role=$ARN_AWS_LAB_ROLE" \
-var "vpc_id=$VPC_ID" \
-var "subnet_database_1_cidr_block=$SUBNET_DATABASE_1_CIDR_BLOCK" 
...variáveis
```

6. **Provisione a infraestrutura**:

```bash
terraform apply \
-var "aws_region=$AWS_REGION" \
-var "arn_aws_lab_role=$ARN_AWS_LAB_ROLE" \
-var "vpc_id=$VPC_ID" \
-var "subnet_database_1_cidr_block=$SUBNET_DATABASE_1_CIDR_BLOCK" 
...variáveis
```

7. **Para destruir a infraestrutura provisionada**:

```bash
terraform destroy \
-var "aws_region=$AWS_REGION" \
-var "arn_aws_lab_role=$ARN_AWS_LAB_ROLE" \
-var "vpc_id=$VPC_ID" \
-var "subnet_database_1_cidr_block=$SUBNET_DATABASE_1_CIDR_BLOCK" 
...variáveis
```

</details>

### Recursos provisionados

Os seguintes recursos serão criados com os arquivos de configuração Terraform:

- VPC;
- 2 Sub-redes privadas;
- Security Groups;

### Acessando a aplicação

Você saberá que tudo estará bem, quando acessar a aplicação principal [https://github.com/ALFAC-Org/food](https://github.com/ALFAC-Org/food) acessando a url do Load Balancer e então tentando cadastrar ou obter alguma informação do sistema.
