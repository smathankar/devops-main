resource "aws_ecr_repository" "ecr_repo" {
  name                 = "${var.prefix}-ecr"
  #image_tag_mutability = "MUTABLE"

}

resource "aws_ssm_parameter" "store_ecr_name" {
  name  = "${var.prefix}-store-ecr-name"
  type  = "String"
  value = aws_ecr_repository.ecr_repo.name
}
