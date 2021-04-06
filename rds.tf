resource "aws_db_subnet_group" "mysql" {
  name       = "main"
  subnet_ids = [module.iti.private1_id, module.iti.private2_id]

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "admin123"
  port                 = 3306
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.mysql.id]
  db_subnet_group_name = aws_db_subnet_group.mysql.name
}