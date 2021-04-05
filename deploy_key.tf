resource "tls_private_key" "deploy_tls" {
    algorithm = "RSA"
    rsa_bits = "4096"  
}


resource "aws_key_pair" "deploy_key" {
      key_name = "key-terraform-centos"
      public_key = tls_private_key.deploy_tls.public_key_openssh
}

resource "local_file" "private_key" {
    content     = tls_private_key.deploy_tls.private_key_pem
    filename = "private_key.pem"
}