variable repo_name {
    description = "Repository name you want to create"
}
variable repo_type {
    description = "Package type of repo"
}

variable user_name {
    description = "Username which get access to repo"
}
variable user_permissions {
    description = "Permission for user"
    type = list(string)
}
