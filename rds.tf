data "aws_db_subnet_group" "database" {
  name = "db-subnetgroup-mano"
}
resource "aws_db_instance" "instancia_db_test" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.RDS-databases-sg-Private.id]
  #db_subnet_group_name = aws_db_subnet_group.db_sub_gp.name
  db_subnet_group_name = data.aws_db_subnet_group.database.name
}



#########################################################
# resource "aws_db_instance" "instancia_db_test" {
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot  = true
#   vpc_security_group_ids = [var.sg_vpc_id]
#   db_subnet_group_name = data.aws_db_subnet_group.database.name
# }