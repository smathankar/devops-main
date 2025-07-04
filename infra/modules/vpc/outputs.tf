output "vpc_id" {
  value       = aws_vpc.main.id
}
#output "subnet_1_id" {
#  value       = aws_subnet.public_subnet.*.id[0]
#}
#output "subnet_2_id" {
#  value       = aws_subnet.public_subnet.*.id[1]
#}
output "subnet_ids" {
  value       = aws_subnet.public_subnet.*.id
}



