resource "aws_redshift_cluster" "default" {
  cluster_identifier = var.REDSHIFT_CLUSTER_ID
  database_name      = var.REDSHIFT_DB_NAME
  master_username    = var.REDSHIFT_MASTER_USERNAME
  master_password    = var.REDSHIFT_MASTER_PASSWORD
  node_type          = var.REDSHIFT_NODE_TYPE
  cluster_type       = var.REDSHIFT_CLUSTER_TYPE
}