variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  default     = "example-eks-cluster"
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  default     = 3
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  default     = 1
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  default     = "example-eks-bucket"
}

variable "jenkins_instance_type" {
  description = "EC2 instance type for Jenkins."
  default     = "t3.medium"
}

variable "key_name" {
  description = "The name of the SSH key pair."
  default     = "my-key"
}

variable "public_key_path" {
  description = "Path to the public key file."
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file."
  default     = "D:/Work/vired/NPS/nps-terraform/private_key.pem"
}

variable "sonarqube_instance_type" {
  description = "EC2 instance type for SonarQube."
  default     = "t3.medium"
}

variable "sonarqube_key_name" {
  description = "The name of the SSH key pair for SonarQube."
  default     = "my-sonarqube-key"
}

variable "sonarqube_public_key_path" {
  description = "Path to the public key file for SonarQube."
  type        = string
}

variable "ansible_inventory_path" {
  description = "Path to Ansible inventory file."
  default     = "./ansible/inventory.ini"
}

variable "ansible_playbook_path" {
  description = "Path to Ansible playbook file."
  default     = "./ansible/playbook.yml"
}

variable "repository_name" {
  description = "The name of the ECR repository."
  type        = string
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository."
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to the repository."
  type        = map(string)
  default     = {}
}

