# vpc_id
output "vpc_id" {
  description = "The VPC id"
  value       = module.vpc.vpc_id
}

output "database_subnets" {
  description = "The database subnets id"
  value       = module.vpc.database_subnets

}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "private_route_table_ids" {
  description = "List of IDs of private route_table"
  value       = module.vpc.private_route_table_ids
}
output "public_subnets" {
  description = "List of IDs of public subnet"
  value       = module.vpc.public_subnets
}
