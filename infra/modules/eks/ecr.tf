resource "aws_ecr_repository" "ecr_awx_1" {
  name                 = "${prefix}-ecr"
  #image_tag_mutability = "MUTABLE"

}
