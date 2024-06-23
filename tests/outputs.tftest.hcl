run "outputs_validation" {
  assert {
    condition     = output.aws-terramino-ec2-public_ip != ""
    error_message = "Instance Public IP output should not be empty"
  }

  assert {
    condition     = output.aws-terramino-ec2-public_dns != ""
    error_message = "Instance Public DNS output should not be empty"
  }
}