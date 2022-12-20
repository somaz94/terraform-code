### VPC

# example

terraform {
  backend "remote" {
    organization = "my-tf-cloud-org"
    workspaces {
      name = "my-workspace"
    }
  }
}


module "eks" {
  source = "../modules/eks"

  aws-region              = "us-east-1"
  availability-zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  cluster-name            = "my-cluster"
  k8s-version             = "1.13"
  node-instance-type      = "t3a.medium"
  desired-capacity        = 3
  max-size                = 5
  min-size                = 1
  vpc-subnet-cidr         = "10.0.0.0/16"
  private-subnet-cidr     = ["10.0.11.0/24", "10.0.21.0/24", "10.0.31.0/24"]
  public-subnet-cidr      = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  db-subnet-cidr          = ["10.0.12.0/24", "10.0.22.0/24", "10.0.23.0/24"]
  eks-cw-logging          = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  ec2-key-public-key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}
