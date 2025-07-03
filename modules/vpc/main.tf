data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
 cidr_block = var.vpc_cidr

 tags = {
   Name = "${var.prefix}-vpc-eks"
 }
}

resource "aws_subnet" "public_subnet" {
 count                   = 2
 vpc_id                  = aws_vpc.main.id
 cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
 availability_zone       = data.aws_availability_zones.available.names[count.index]
 map_public_ip_on_launch = true

 tags = {
   Name = "${var.prefix}-public-subnet-eks-${count.index}"
 }
}

resource "aws_internet_gateway" "main" {
 vpc_id = aws_vpc.main.id

 tags = {
   Name = "${var.prefix}-main-igw-eks"
 }
}

resource "aws_route_table" "public" {
 vpc_id = aws_vpc.main.id

 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.main.id
 }

 tags = {
   Name = "${var.prefix}-main-rt-eks"
 }
}

resource "aws_route_table_association" "a" {
 count          = 2
 subnet_id      = aws_subnet.public_subnet.*.id[count.index]
 route_table_id = aws_route_table.public.id
}
