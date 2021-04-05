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
    cidr_blocks = [module.iti.vpc_cidr_block]
  }

  tags = {
    Name = "private"
  }
}