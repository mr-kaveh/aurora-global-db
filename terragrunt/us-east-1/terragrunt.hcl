terraform {
  source = "../terraform/aurora"
}

inputs = {
  region                = "eu-east-1"
  cluster_identifier    = "my-global-db"
  master_username       = "admin"
  master_password       = "password123"
  database_name         = "mydatabase"
  availability_zones    = ["eu-east-1a", "eu-east-1b", "eu-east-1c"]
  instance_count        = 2
  instance_class        = "db.r5.large"
  db_subnet_group_name  = "aurora-subnet-group"
  subnet_ids            = ["subnet-98765432", "subnet-87654321", "subnet-76543210"]
  vpc_id                = "vpc-87654321"
}
