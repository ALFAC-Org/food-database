# Food-Database
Repositório para armazenar a criação do banco de dados na cloud

## Razões para usar um banco relacional (MYSql)
- Estrutura de dados bem definida e com suporte a chaves estrangeiras. Isso permite garantirmos a consistência dos dados, como por exemplo, um pedido deve estar sempre associado a um cliente válido.
- A estrutura relacional facilita o gerenciamento de relacionamentos complexos entre diferentes entidades, como por exemplo, entre clientes, pedidos, itens e pagamentos.
- Alterações na estrutura dos dados, como adicionar novas colunas ou modificar os relacionamentos entre as tabelas, podem ser realizadas de forma controlada e com menor risco para o sistema.
- Embora a escalabilidade horizontal não seja uma opção, ainda podemos explorar a escalabilidade vertical. Além disso, para atender a necessidades futuras, poderíamos considerar a utilização de um banco de dados chave-valor com persistência em memória, como o Redis. Esse banco poderia ser usado para armazenar o catálogo de produtos em cache, permitindo que as consultas sejam direcionadas primariamente para ele, o que ajudaria a melhorar a performance do sistema.

## MER
