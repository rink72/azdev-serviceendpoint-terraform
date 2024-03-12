variable project_name {
}

variable azurerm_endpoints {
    type = map(object(
        {
            endpoint_name = string
            description =  string
            subscription_id = string
            subscription_name = string
            service_principal_client_id = string
            tenant_id = string
        }
    ))
    default = {}
}

variable sonarcloud_endpoints {
    type = map(object(
        {
            endpoint_name = string
            description = string
            keyvault_name = string
            keyvault_secret_name = string
            keyvault_resource_group = string
        }
    ))
    default = {}
}

variable snyk_endpoints {
    type = map(object(
        {
            endpoint_name = string
            description = string
            keyvault_name = string
            keyvault_secret_name = string
            keyvault_resource_group = string
        }
    ))
    default = {}
}