provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "minecraft" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t3.medium"
  key_name      = "minesible-kp"

  tags = {
    Name = "MinecraftServer"
  }

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y python3
EOF
}

resource "aws_s3_bucket" "minecraft_saves" {
  bucket = "minecraft-server-saves-${random_id.bucket_id.hex}"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
