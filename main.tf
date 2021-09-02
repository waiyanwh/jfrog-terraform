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
  
  username = "${var.username}"
  email    = "${var.email}"
  password = "${var.password}"
  group_name  = "${var.group_name}"
  repo_name = "${var.repo_name}"
  groups   = "${var.groups}"
  repos    = "${var.repos}"
  user_perms    = "${var.user_perms}"
  group_perms   = "${var.group_perms}"
  
}
