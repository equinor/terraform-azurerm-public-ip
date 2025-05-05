# Terraform module for Azure Public IP

[![GitHub License](https://img.shields.io/github/license/equinor/terraform-azurerm-public-ip)](https://github.com/equinor/terraform-azurerm-public-ip/blob/main/LICENSE)
[![GitHub Release](https://img.shields.io/github/v/release/equinor/terraform-azurerm-public-ip)](https://github.com/equinor/terraform-azurerm-public-ip/releases/latest)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![SCM Compliance](https://scm-compliance-api.radix.equinor.com/repos/equinor/terraform-azurerm-public-ip/badge)](https://developer.equinor.com/governance/scm-policy/)

Terraform module which creates Azure Public IP resources.

## Features

- Creates a standard tier Public IP address in the specified resource group.
- Audit logs sent to given Log Analytics workspace by default.

## Prerequisites

- Azure role `Contributor` at the resource group scope.
- Azure role `Log Analytics Contributor` at the Log Analytics workspace scope.

## Usage

```terraform
provider "azurerm" {
  features {}
}

module "public_ip" {
  source  = "equinor/public-ip/azurerm"
  version = "~> 1.1"

  address_name               = "example-ip"
  resource_group_name        = azurerm_resource_group.example.name
  location                   = azurerm_resource_group.example.location
  log_analytics_workspace_id = module.log_analytics.workspace_id
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
}

module "log_analytics" {
  source  = "equinor/log-analytics/azurerm"
  version = "~> 2.3"

  workspace_name      = "example-workspace"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}
```

## Contributing

See [Contributing guidelines](https://github.com/equinor/terraform-baseline/blob/main/CONTRIBUTING.md).
