resource "aws_security_group" "public" {
  name        = "allow_ssh_public"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.iti.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "outbound free access"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }

  tags = {
    Name = "public"
  }
}

resource "aws_security_group" "private" {
  name        = "allow_ssh_private"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.iti.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.iti.vpc_cidr_block]
  }

  ingress {
    description = "ssh from VPC"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
#    cidr_blocks = [module.iti.vpc_cidr_block]
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    description = "outbound free access"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }

  tags = {
    Name = "private"
  }
}


resource "aws_security_group" "mysql" {
  name        = "mysql"
  description = "Allow mysql port"
  vpc_id      = module.iti.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [module.iti.vpc_cidr_block]
  }

  egress {
    description = "outbound free access"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }

  tags = {
    Name = "mysql"
  }
}

resource "aws_security_group" "redis" {
  name        = "redis"
  description = "Allow redis port"
  vpc_id      = module.iti.vpc_id

  ingress {
    description = "ssh from VPC"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [module.iti.vpc_cidr_block]
  }

  egress {
    description = "outbound free access"
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }

  tags = {
    Name = "redis"
  }
}