variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start."
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance."
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the instance."
  type        = string
}

variable "ansible_inventory_path" {
  description = "Path to Ansible inventory file."
  default     = "./inventory.ini"
}

variable "ansible_playbook_path" {
  description = "Path to Ansible playbook file."
  default     = "./playbook.yml"
}
