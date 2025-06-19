output "ec2_ip" {
  value = aws_instance.minecraft.public_ip
}

output "s3_bucket" {
  value = aws_s3_bucket.minecraft_saves.bucket
}
