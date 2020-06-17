resource "aws_instance" "Server1" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.aws_ssh_key
  vpc_security_group_ids = [aws_security_group.sg_server1.id]

  tags = {
    Name         = "Server1"
    Owner        = var.owner
    Project_name = var.project_name
    Project_env  = var.project_env

  }

  lifecycle {
    ignore_changes = [
      ami
    ]
  }
}
