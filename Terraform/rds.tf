resource "aws_db_instance" "my_db" {
  allocated_storage      = var.rds_db_storage
  storage_type           = "gp2"
  engine                 = var.rds_db_engine
  engine_version         = "8.0.17"
  instance_class         = var.rds_db_instance_type
  name                   = var.rds_db_name
  username               = var.rds_db_username
  password               = var.rds_db_passwd
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.sg_mydb.id]

  tags = {
    Name         = var.rds_db_name
    Owner        = var.owner
    Project_name = var.project_name
    Project_env  = var.project_env
  }
}
