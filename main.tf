provider "aws" {
  region = var.region
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "iam" {
  source = "./modules/iam"
}

module "eks" {
  source           = "./modules/eks"
  cluster_name     = var.cluster_name
  vpc_id           = module.vpc.vpc_id
  subnet_ids       = module.vpc.subnet_ids
  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_group_role_arn
  desired_size     = var.desired_size
  max_size         = var.max_size
  min_size         = var.min_size
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "security_group" {
  source = "./modules/security_group/jenkins"
  vpc_id = module.vpc.vpc_id
}

module "key_pair_generate" {
  source           = "./modules/key_pair_generate"
  private_key_path = var.private_key_path
}

module "key_pair" {
  source          = "./modules/key_pair/jenkins"
  key_name        = var.key_name
  public_key_path = var.public_key_path
  # public_key      = module.key_pair_generate.public_key
}

module "ec2_jenkins" {
  source            = "./modules/ec2/jenkins"
  vpc_id            = module.vpc.vpc_id
  subnet_id         = element(module.vpc.subnet_ids, 0)
  instance_type     = var.jenkins_instance_type
  key_name          = module.key_pair.key_name
  security_group_id = module.security_group.jenkins_security_group_id
}

module "security_group_sonarqube" {
  source = "./modules/security_group/sonarqube"
  vpc_id = module.vpc.vpc_id
}

module "key_pair_sonarqube" {
  source          = "./modules/key_pair/sonarqube"
  key_name        = var.sonarqube_key_name
  public_key_path = var.sonarqube_public_key_path
  # public_key      = module.key_pair_generate.public_key
}

module "ec2_sonarqube" {
  source            = "./modules/ec2/sonarqube"
  vpc_id            = module.vpc.vpc_id
  subnet_id         = element(module.vpc.subnet_ids, 0)
  instance_type     = var.sonarqube_instance_type
  key_name          = module.key_pair_sonarqube.key_name
  security_group_id = module.security_group_sonarqube.sonarqube_security_group_id
}

module "ecr" {
  source               = "./modules/ecr"
  repository_name      = var.repository_name
  image_tag_mutability = var.image_tag_mutability
  scan_on_push         = var.scan_on_push
  tags                 = var.tags
}
