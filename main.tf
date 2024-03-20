provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "db_security_group" {
  vpc_id      = var.vpc_id
  name        = "db_security_group"
  description = "Allow all inbound for Postgres"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "postgres_db_subnet_group" {

  name       = "db-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "DB Subnet Group"
  }

}

resource "aws_db_instance" "postgresql_rds_instance" {
  identifier          = "lanchonete-db"
  allocated_storage   = 10
  engine              = "postgres"
  engine_version      = "16"
  instance_class      = "db.t3.small"
  db_name             = "lanchonete"
  username            = "username"
  password            = "password"
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.db_security_group.id]

  db_subnet_group_name = aws_db_subnet_group.postgres_db_subnet_group.name

}