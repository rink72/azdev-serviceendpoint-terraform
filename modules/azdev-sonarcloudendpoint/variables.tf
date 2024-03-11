variable "project_id" {
    type = string
    description = "Azure DevOps project id"
}

variable "endpoint_configuration" {
    type = object(
        {
            endpoint_name = string
            description = string
            keyvault_name = string
            keyvault_secret_name = string
            keyvault_resource_group = string
        }
    )
    description = "Configuration for the service endpoint"
}
