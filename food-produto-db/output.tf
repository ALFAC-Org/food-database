output "dynamodb_table_name" {
  value = aws_dynamodb_table.food_produto_dynamodb.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.food_produto_dynamodb.arn
}