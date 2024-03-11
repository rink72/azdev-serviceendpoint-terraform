locals {
    project_name = "lab"

}

module "azdev_projects" {
    source = "../modules/azdev-serviceendpoint"
    project_name = local.project_name

    azurerm_endpoints = {
        "dev" = {
            endpoint_name = "dev"
            description = "dev"
            subscription_id = "b530b5ac-8ca6-4393-b35f-068dcb970647"
            subscription_name = "dev"
            service_principal_client_id = "f1e435f2-387d-4b91-949f-8e5eb8ab038b"
            tenant_id = "54406fc1-bb8f-46c7-ae4d-4e4e563f1d5d"
        }
    }

    sonarcloud_endpoints = {
        "sonarcloud" = {
            endpoint_name = "sonarcloud-sve"
            description = "sonarcloud-sve"
            keyvault_name = "rink72-shared-kv"
            keyvault_secret_name = "sonarcloud-key"
            keyvault_resource_group = "shared-infra"
        }
    }

    snyk_endpoints = {
        "snyk" = {
            endpoint_name = "snyk-sve"
            description = "snyk-sve"
            keyvault_name = "rink72-shared-kv"
            keyvault_secret_name = "snyk-secret"
            keyvault_resource_group = "shared-infra"
        }
    }
}