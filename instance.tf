resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id = module.iti.public1_id
  vpc_security_group_ids = [aws_security_group.public.id]
  key_name = aws_key_pair.deploy_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "bastion-EC2-ubuntu"
  }

  provisioner "local-exec" {
    command = "echo the ip of bastion is ${self.public_ip}"
  }
}

resource "aws_instance" "application" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id = module.iti.public1_id
  vpc_security_group_ids = [aws_security_group.private.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.deploy_key.key_name

  tags = {
    Name = "application-EC2-ubuntu"
  }
}


