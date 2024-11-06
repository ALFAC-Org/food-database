resource "aws_dynamodb_table" "food_produto_dynamodb" {
  name           = "food_produto"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"

  attribute {
	name = "id"
	type = "S"
  }

  tags = {
	Name = "food_produto_dynamodb"
  }
}