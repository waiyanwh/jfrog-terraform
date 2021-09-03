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
  name             = var.group
  description      = "test group"
  admin_privileges = false
}

# User Creation
resource "artifactory_user" "user" {
  name     = var.user_name
  email    = var.email
  groups   = [var.group]
  password = var.password
}

