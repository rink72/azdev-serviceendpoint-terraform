locals {
  endpoint_definitions = yamldecode(file("${path.root}/../configuration/endpoints.yml"))["endpoints"]
  projects             = yamldecode(file("${path.root}/../configuration/group-one.yml"))["projects"]

  endpoint_map = {
    for type, endpoints in local.endpoint_definitions :
    type => { for endpoint in endpoints : endpoint.endpoint_name => endpoint }
  }
}

module "azdev_projects" {
  for_each = { for idx, project in local.projects : idx => project }
  source   = "../modules/azdev-project"

  project_name = each.value.name

  sonarcloud_endpoints = { for name in lookup(each.value, "sonarcloud_endpoints", []) : name => local.endpoint_map["sonarcloud"][name] }
  azurerm_endpoints    = { for name in lookup(each.value, "azurerm_endpoints", []) : name => local.endpoint_map["azurerm"][name] }
  snyk_endpoints       = { for name in lookup(each.value, "snyk_endpoints", []) : name => local.endpoint_map["snyk"][name] }
}
