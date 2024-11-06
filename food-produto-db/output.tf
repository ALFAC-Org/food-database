output "dynamodb_table_name" {
  value = aws_dynamodb_table.food_product_dynamodb.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.food_product_dynamodb.arn
}