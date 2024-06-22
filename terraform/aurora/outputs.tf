output "cluster_endpoint" {
  description = "The endpoint of the Aurora cluster"
  value       = aws_rds_cluster.aurora.endpoint
}

output "reader_endpoint" {
  description = "The reader endpoint of the Aurora cluster"
  value       = aws_rds_cluster.aurora.reader_endpoint
}

output "cluster_id" {
  description = "The ID of the Aurora cluster"
  value       = aws_rds_cluster.aurora.id
}

output "cluster_arn" {
  description = "The ARN of the Aurora cluster"
  value       = aws_rds_cluster.aurora.arn
}

output "primary_instance_ids" {
  description = "The IDs of the primary instances in the Aurora cluster"
  value       = [for instance in aws_rds_cluster_instance.aurora_instances : instance.id]
}

output "db_subnet_group_name" {
  description = "The name of the DB subnet group used by the Aurora cluster"
  value       = aws_db_subnet_group.aurora.name
}

output "security_group_id" {
  description = "The ID of the security group used by the Aurora cluster"
  value       = aws_security_group.aurora_sg.id
}
