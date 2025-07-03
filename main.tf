
module "vpc" {
  source                    = "./modules/vpc"
  
  prefix                    = var.prefix
  environment               = var.environment
  
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
