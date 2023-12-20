resource "azurerm_public_ip" "this" {
  name                = var.address_name
  resource_group_name = var.resource_group_name
  location            = var.location

  # Basic sku will be retired by 30 September 2025
  # Ref: https://azure.microsoft.com/en-us/updates/upgrade-to-standard-sku-public-ip-addresses-in-azure-by-30-september-2025-basic-sku-will-be-retired/
  sku = "Standard"

  # If sku is "Standard", allocation_method must be "Static".
  # Ref: https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/public-ip-addresses#sku
  allocation_method = "Static"

  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = var.diagnostic_setting_name
  target_resource_id         = azurerm_public_ip.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "enabled_log" {
    for_each = toset(var.diagnostic_setting_enabled_log_categories)

    content {
      category = enabled_log.value
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = false
  }
}
