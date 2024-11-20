resource "aws_dynamodb_table" "food_produto_dynamodb" {
  name           = "food_produto"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
	name = "id"
	type = "N"
  }

  attribute {
    name = "uuid"
    type = "B"
  }

  attribute {
    name = "nome"
    type = "S"
  }

  attribute {
    name = "preco"
    type = "N"
  }

  attribute {
    name = "categoria"
    type = "S"
  }

  tags = {
	Name = "food_produto_dynamodb"
  }
}