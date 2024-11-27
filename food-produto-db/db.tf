resource "aws_dynamodb_table" "food_produto_dynamodb" {
  name           = "food_produto"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
	name = "id"
	type = "N"
  }

  tags = {
	Name = "food_produto_dynamodb"
  }
}

resource "aws_dynamodb_resource_policy" "dynamodb_policy" {
  resource_arn = aws_dynamodb_table.food_produto_dynamodb.arn
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.arn_aws_lab_role
        }
        Action   = "dynamodb:*"
        Resource = aws_dynamodb_table.food_produto_dynamodb.arn
      }
    ]
  })

  depends_on = [aws_dynamodb_table.food_produto_dynamodb]
}