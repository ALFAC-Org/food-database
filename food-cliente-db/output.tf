output "database_subnet_id_1" {
  value       = "${aws_subnet.food_cliente_database_subnet_az_1.id}"
  description = "This is the Database Subnet ID for later use"
}

output "database_subnet_id_2" {
  value       = "${aws_subnet.food_cliente_database_subnet_az_2.id}"
  description = "This is the Database Subnet ID for later use"
}