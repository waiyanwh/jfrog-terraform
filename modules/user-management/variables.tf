variable username {
    description = "The user name you want to create"
}
variable password {
    description = "Password for user"
}
variable email {
    description = "User's email address"
}
variable group_name {
    description = "Group name you want to create"
}
variable repo_name {
    description = "Repository name you want to create"
}
variable groups {
    description = "Groups name for users"
    type    = list(string)
}
variable user_perms {
    description = "Permission for user"
    type = list(string)
}
variable group_perms {
    description = "Permission for group"
    type = list(string)
}
variable repos {
    description = "Repos you want to assign to user and group"
    type = list(string)
}