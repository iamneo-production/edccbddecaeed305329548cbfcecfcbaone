terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "ap-northeast-1"  # Singapore region
  access_key = "AKIAQ4XSAOEF7IJKZ44S"
  secret_key = "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"
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
