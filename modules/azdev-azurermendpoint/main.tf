data "azuread_application" "target_application" {
  client_id = var.endpoint_configuration.service_principal_client_id
}

resource "time_rotating" "example" {
  rotation_days = 7
}

resource "azuread_application_password" "target_password" {
  application_id = data.azuread_application.target_application.id

  rotate_when_changed = {
    rotation = time_rotating.example.id
  }
}

resource "azuredevops_serviceendpoint_azurerm" "azurerm" {
  project_id                             = var.project_id
  service_endpoint_name                  = var.endpoint_configuration.endpoint_name
  description                            = var.endpoint_configuration.description
  service_endpoint_authentication_scheme = "ServicePrincipal"
  azurerm_spn_tenantid                   = var.endpoint_configuration.tenant_id
  azurerm_subscription_id                = var.endpoint_configuration.subscription_id
  azurerm_subscription_name              = var.endpoint_configuration.subscription_name

  credentials {
    serviceprincipalid  = var.endpoint_configuration.service_principal_client_id
    serviceprincipalkey = azuread_application_password.target_password.value
  }
}
