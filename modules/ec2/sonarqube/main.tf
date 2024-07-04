resource "aws_instance" "sonarqube" {
  ami                         = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (replace with the latest AMI)
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "sonarqube"
  }
}

resource "null_resource" "ansible_provision" {
  provisioner "local-exec" {
    command = <<EOT
      ansible-playbook -i ${path.module}/inventory.ini ${path.module}/playbook.yml
    EOT

    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }

  depends_on = [aws_instance.sonarqube]
}

output "instance_public_ip" {
  value = aws_instance.sonarqube.public_ip
}
