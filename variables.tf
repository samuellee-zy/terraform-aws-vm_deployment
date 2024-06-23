variable "region" {
  type        = string
  description = "Value to deploy resources into specific region"
  default     = "ap-southeast-2"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR for Subnet"
  default     = "10.0.0.0/24"
}

variable "instance_type" {
  type        = string
  description = "Type of instance to use"
  default     = "t2.micro"
}

variable "ec2-name" {
  type        = string
  description = "Name for EC2 instance"
  default     = "Sam"
}
