resource "aws_db_instance" "postgres" {
  identifier           = "dev-postgres"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "16.1"
  instance_class       = "db.t3.micro"
  name                 = "dev"
  username             = "dbadmin"
  password             = "dupadupa"
  parameter_group_name = "default.postgres16"
  skip_final_snapshot  = true
  publicly_accessible  = false

  vpc_security_group_ids = [aws_security_group.postgres_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.postgres_subnet_group.name
}

resource "aws_security_group" "postgres_sg" {
  name        = "postgres-sg"
  description = "Security group for PostgreSQL instance"
  vpc_id      = aws_vpc.main.id
}

resource "aws_db_subnet_group" "postgres_subnet_group" {
  name       = "postgres-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.private_subnet_2.id]
}
