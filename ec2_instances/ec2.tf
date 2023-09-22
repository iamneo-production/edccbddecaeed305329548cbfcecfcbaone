terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "ap-southeast-1"  # Singapore region
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}

resource "aws_instance" "linux_server" {
  ami           = "ami-0f9ae750e8274075b"  # SUSE Linux Enterprise Server 12 SP5
  instance_type = "t2.micro"

  tags = {
    Name = "MyLinuxServer"
  }
}

output "public_ip" {
  value = aws_instance.linux_server.public_ip
}
