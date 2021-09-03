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
variable groups {
    description = "Groups name for users"
    type    = list(string)
}
