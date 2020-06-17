resource "aws_security_group" "sg_server1" {
  name = "sg_server1"

  ingress {
    description = "SSH from my PC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name         = "sg_server1"
    Owner        = var.owner
    Project_name = var.project_name
    Project_env  = var.project_env
  }
}

resource "aws_security_group" "sg_mydb" {
  name = "sg_mydb"

  ingress {
    description     = "Connection to DB"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_server1.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name         = "sg_mydb"
    Owner        = var.owner
    Project_name = var.project_name
    Project_env  = var.project_env
  }
}
