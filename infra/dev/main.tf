
module "vpc" {
  source                    = "../modules/vpc"
  
  vpc_cidr             = var.vpc_cidr
  prefix               = var.prefix
  
  #depends_on = [ module.s3_bucket ]
}

module "eks" {
  source                    = "../modules/eks"
  
  prefix               = var.prefix
  subnet_ids           = module.vpc.subnet_ids
  vpc_id               = module.vpc.vpc_id
  
  depends_on = [ module.vpc ]
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
