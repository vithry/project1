variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" { default = "eu-central-1" }


#main
variable "project_env" { default = "dev" }
variable "project_name" { default = "MyProject" }
variable "owner" { default = "Vitalii" }

#ec2
variable "instance_type" { default = "t2.micro" }
variable "my_ip" {}

#rds
variable "rds_db_instance_type" { default = "db.t2.micro" }
variable "rds_db_storage" { default = "20" }
variable "rds_db_engine" { default = "mysql" }
variable "rds_db_name" { default = "my_db" }
variable "rds_db_username" { default = "root" }
variable "rds_db_passwd" {}

#other
variable "instance_key_path" { default = "~/.ssh/key1.pem" }
variable "aws_ssh_key" { default = "key1" }
