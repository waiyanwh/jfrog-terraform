variable repo_name {
    description = "Repository name you want to create"
}
variable repo_type {
    description = "Package type of repo"
}

variable group_name {
    description = "Group name which get access to repo"
}
variable group_perms {
    description = "Permission for group"
    type = list(string)
}
variable repos {
    description = "Repos you want to assign to user and group"
    type = list(string)
}
