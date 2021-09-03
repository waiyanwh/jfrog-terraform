# Required for Terraform 0.13 and up (https://www.terraform.io/upgrade-guides/0-13.html)
terraform {
  required_providers {
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "2.2.7"
    }
  }
}

# Configure the Artifactory provider
provider "artifactory" {
  url = "${var.artifactory_url}/artifactory"
  username = var.artifactory_username
  password = var.artifactory_password
}

module "user-management" {
  source = "./modules/user-management"
  
  user_name     = var.repo_project1.users.user_name
  password      = var.repo_project1.users.password
  email         = var.repo_project1.users.email
  group         = var.repo_project1.group
  
}

module "repo-management" {
  depends_on = [module.user-management]
  source = "./modules/repo-management"

  repo_name        = var.repo_project1.repo_name
  repo_type        = var.repo_project1.repo_type
  user_name        = module.user-management.user-id
  user_permissions = var.repo_project1.users.user_permissions
}
