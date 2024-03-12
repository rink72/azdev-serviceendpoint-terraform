data "azuredevops_project" "target_project" {
  name = var.project_name
}

module "azurerm_endpoints" {
    for_each = var.azurerm_endpoints    
    source = "../azdev-azurermendpoint"

    project_id = data.azuredevops_project.target_project.id

    endpoint_configuration = each.value
}

module "sonarcloud_endpoints" {
    for_each = var.sonarcloud_endpoints
    source = "../azdev-sonarcloudendpoint"

    project_id = data.azuredevops_project.target_project.id

    endpoint_configuration = each.value
}

module "snyk_endpoints" {
    for_each = var.snyk_endpoints
    source = "../azdev-snykendpoint"

    project_id = data.azuredevops_project.target_project.id

    endpoint_configuration = each.value
}