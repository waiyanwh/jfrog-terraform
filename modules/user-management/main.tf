terraform {
  required_providers {
    artifactory = {
      source  = "registry.terraform.io/jfrog/artifactory"
      version = "2.2.7"
    }
  }
}

# Group Creation
resource "artifactory_group" "group" {
  count            = var.group_name == "" ? 0 : 1
  name             = "terraform"
  description      = "test group"
  admin_privileges = false
}

# User Creation
resource "artifactory_user" "user" {
  name     = var.username
  email    = var.email
  groups   = var.groups
  password = var.password
}

# Repository creation
resource "artifactory_local_repository" "my-local" {
  key          = var.repo_name
  package_type = "maven"
}

resource "artifactory_permission_target" "test-perm" {
  name = "perm"

  repo {
    includes_pattern = ["**"]
    excludes_pattern = ["**"]
    repositories     = var.repos

    actions {
      users {
        name        = var.username
        permissions = var.user_perms
      }
    groups {
        name        = var.group_name
        permissions = var.group_perms
      }
    }
  }
}