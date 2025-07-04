resource "aws_ecr_repository" "ecr_repo" {
  name                 = "${var.prefix}-ecr"
  #image_tag_mutability = "MUTABLE"

}
