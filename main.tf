provider "aws" {
  region = var.region
}

data "hcp_packer_artifact" "aws-terramino" {
  bucket_name  = "aws-terramino"
  channel_name = "latest"
  platform     = "aws"
  region       = var.region
}

resource "aws_vpc" "aws-terramino" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "aws-terramino-vpc"
  }
}

resource "aws_subnet" "aws-terramino" {
  vpc_id                  = aws_vpc.aws-terramino.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "aws-terramino-subnet"
  }
}

resource "aws_internet_gateway" "aws-terramino" {
  vpc_id = aws_vpc.aws-terramino.id
  tags = {
    Name = "aws-terramino-igw"
  }
}

resource "aws_route_table" "aws-terramino" {
  vpc_id = aws_vpc.aws-terramino.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws-terramino.id
  }
  tags = {
    Name = "aws-terramino-rt"
  }
}

resource "aws_route_table_association" "aws-terramino" {
  subnet_id      = aws_subnet.aws-terramino.id
  route_table_id = aws_route_table.aws-terramino.id
}

resource "aws_security_group" "aws-terramino" {
  name   = "aws-terramino-sg"
  vpc_id = aws_vpc.aws-terramino.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "aws-terramino-sg"
  }
}

resource "aws_instance" "aws-terramino" {
  ami                         = data.hcp_packer_artifact.aws-terramino.external_identifier
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.aws-terramino.id
  vpc_security_group_ids      = [aws_security_group.aws-terramino.id]
  associate_public_ip_address = true
  tags = {
    Name = "${var.ec2-name}-aws-terramino-ec2-${timestamp()}"
  }
}

