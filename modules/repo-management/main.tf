# Required for Terraform 0.13 and up (https://www.terraform.io/upgrade-guides/0-13.html)
terraform {
  required_providers {
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "2.2.7"
    }
  }
}

# Repository creation
resource "artifactory_local_repository" "local" {
  key          = var.repo_name
  package_type = var.repo_type
}

resource "artifactory_permission_target" "perm" {
  name = "permission"

  repo {
    includes_pattern = ["**"]
    excludes_pattern = ["**"]
    repositories     = [var.repo_name]

    actions {
      users {
        name        = var.user_name
        permissions = var.user_permissions
      }
    }
  }
}