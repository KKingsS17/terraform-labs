# Specifiy the provider and version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

locals {
  prefix = "contoso"
  region = "UK South"
  tags = {
    cost_center = "contoso research"
  }
}

# Create the very first resource
resource "azurerm_resource_group" "contoso_rg" {
  name     = "${local.prefix}_rg"
  location = local.region
  tags     = local.tags
}

resource "azurerm_resource_group" "contoso_dev_rg" {
  name     = "${local.prefix}_dev_rg"
  location = local.region
  tags     = local.tags
}
