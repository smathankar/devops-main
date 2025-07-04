resource "aws_ecr_repository" "ecr_repo" {
  name                 = "${prefix}-ecr"
  #image_tag_mutability = "MUTABLE"

}
