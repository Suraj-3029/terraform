
output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "cluster_arn" {
  value = module.eks.cluster_arn
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "jenkins_instance_public_ip" {
  value = module.ec2_jenkins.instance_public_ip
}

output "sonarqube_instance_public_ip" {
  value = module.ec2_sonarqube.instance_public_ip
}

output "repository_url" {
  value = module.ecr.repository_url
}

output "repository_arn" {
  value = module.ecr.repository_arn
}
