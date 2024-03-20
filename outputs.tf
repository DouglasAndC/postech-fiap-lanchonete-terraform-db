output "eks_cluster_id" {
  value = aws_db_instance.postgresql_rds_instance.id
}