variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets."
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "The ARN of the EKS cluster role."
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the EKS node group role."
  type        = string
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = number
}
