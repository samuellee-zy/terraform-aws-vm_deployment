output "aws-terramino-ec2-public_ip" {
  value = aws_instance.aws-terramino.public_ip
}

output "aws-terramino-ec2-public_dns" {
  value = aws_instance.aws-terramino.public_dns
}

output "aws-terramino-id" {
  value = aws_instance.aws-terramino.id
}
