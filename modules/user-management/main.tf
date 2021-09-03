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
  name             = var.group_name
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

