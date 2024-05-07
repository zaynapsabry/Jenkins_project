terraform {
  backend "s3" {
    bucket = "zeinab-bucket-terraform"
    key    = "terraform.tfstate"
    dynamodb_table = "zeinab-dynamodb"
    region = "eu-west-1"
  }
}
