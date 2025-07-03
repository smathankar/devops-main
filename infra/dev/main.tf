
module "vpc" {
  source                    = "./modules/vpc"
  
  vpc_cidr             = var.vpc_cidr
  prefix               = var.prefix
  
  #depends_on = [ module.s3_bucket ]
}









#resource "aws_s3_bucket" "my_bucket" {
#  bucket = var.bucket_name
#  acl    = "private"
#  tags = {
#    Name        = var.bucket_name
#    Environment = "test1"
#    Project     = "Terraform"
#    Owner       = "DevOpsTeam"
#  }
#}
