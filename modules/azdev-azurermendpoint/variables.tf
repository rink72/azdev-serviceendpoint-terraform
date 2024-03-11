variable "project_id" {
    type = string
    description = "Azure DevOps project id"
}

variable "endpoint_configuration" {
    type = object(
        {
            endpoint_name = string
            description = string
            subscription_id = string
            subscription_name = string
            service_principal_client_id = string
            tenant_id = string
        }
    )
    description = "Configuration for the service endpoint"
}
