provider "aws" {
  region = var.region
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = var.cluster_identifier
  engine                  = "aurora-mysql"
  engine_mode             = "provisioned"
  master_username         = var.master_username
  master_password         = var.master_password
  database_name           = var.database_name
  availability_zones      = var.availability_zones
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  vpc_security_group_ids  = [aws_security_group.aurora_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.aurora.name
}

resource "aws_rds_cluster_instance" "aurora_instances" {
  count                = var.instance_count
  identifier           = "${var.cluster_identifier}-instance-${count.index}"
  cluster_identifier   = aws_rds_cluster.aurora.id
  instance_class       = var.instance_class
  engine               = "aurora-mysql"
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.aurora.name
}

resource "aws_db_subnet_group" "aurora" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "aurora_sg" {
  name        = "aurora_sg"
  description = "Aurora security group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "cluster_endpoint" {
  value = aws_rds_cluster.aurora.endpoint
}

output "reader_endpoint" {
  value = aws_rds_cluster.aurora.reader_endpoint
}
