terraform {
  source = "../terraform/aurora"
}

inputs = {
  region                = "us-east-1"
  cluster_identifier    = "my-global-db"
  master_username       = "admin"
  master_password       = "password123"
  database_name         = "mydatabase"
  availability_zones    = ["us-east-1a", "us-east-1b", "us-east-1c"]
  instance_count        = 2
  instance_class        = "db.r5.large"
  db_subnet_group_name  = "aurora-subnet-group"
  subnet_ids            = ["subnet-12345678", "subnet-23456789", "subnet-34567890"]
  vpc_id                = "vpc-12345678"
}
