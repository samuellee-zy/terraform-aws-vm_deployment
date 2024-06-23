variables {
  create = true
  name = "test-instance"
  ami = "ami-0c94855ba95c574c8"
  instance_type = "t2.micro"
}

run "instance_type_t2-micro" {
  assert {
    condition     = aws_instance.aws-terramino.instance_type == "t2.micro"
    error_message = "Instance type is incorrect"
  }
}