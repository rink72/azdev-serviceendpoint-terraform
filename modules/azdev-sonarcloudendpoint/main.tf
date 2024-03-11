data "azurerm_key_vault" "target_keyvault" {
  name                = var.endpoint_configuration.keyvault_name
  resource_group_name = var.endpoint_configuration.keyvault_resource_group
}

data "azurerm_key_vault_secret" "target_secret" {
  name         = var.endpoint_configuration.keyvault_secret_name
  key_vault_id = data.azurerm_key_vault.target_keyvault.id
}

resource "azuredevops_serviceendpoint_sonarcloud" "sonarcloud" {
  project_id            = var.project_id
  service_endpoint_name = var.endpoint_configuration.endpoint_name
  description           = var.endpoint_configuration.description
  token                 = data.azurerm_key_vault_secret.target_secret.value
}
