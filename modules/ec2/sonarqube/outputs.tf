output "instance_public_ip_sonarqube" {
  value = aws_instance.sonarqube.public_ip
}
