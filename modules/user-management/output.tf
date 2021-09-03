output "user-id" {
    description = "Username of the user"
    value = artifactory_user.user.id
}

output "group-id" {
    description = "Group name"
    value = artifactory_group.group[0].name
}