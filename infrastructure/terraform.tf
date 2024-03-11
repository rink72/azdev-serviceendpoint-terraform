terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.1.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.47.0"
    }
  }
  backend "azurerm" {
    subscription_id      = ""
    resource_group_name  = "rink72tf-rg"
    storage_account_name = "rink72tfsa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  use_cli             = true
  storage_use_azuread = true
}

provider "azuredevops" {
  # org_service_url = "https://dev.azure.com/rink72"
  # Configuration via environment variables
}

provider "azuread" {}
