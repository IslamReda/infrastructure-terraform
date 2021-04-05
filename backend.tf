terraform {
  backend "s3" {
    bucket = "iti-terraform-course"
    key    = "iti/dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "backend"
  }
}