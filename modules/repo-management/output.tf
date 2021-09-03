output repo-id {
    description = "Name of cther repositroy"
    value = artifactory_local_repository.local.id
}

output perm-id {
    description = "Name of permission "
    value = artifactory_permission_target.perm.id
}