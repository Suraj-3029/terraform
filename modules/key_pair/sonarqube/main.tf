resource "aws_key_pair" "sonarqube_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}
