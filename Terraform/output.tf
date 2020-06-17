output "instance" {
  value = "${aws_instance.Server1.public_ip}"
}

output "rds" {
  value = "${aws_db_instance.my_db.endpoint}"
}
