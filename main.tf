resource "azurerm_network_security_group" "this" {  
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.security_rules != null ? var.security_rules : []

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

module "diagnosticSetting" {
  source = "git::https://github.com/Noya50/hafifot-diagnosticSetting.git"

  name                       = "${azurerm_network_security_group.this.name}-diagnostic-setting"
  target_resource_id         = azurerm_network_security_group.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  diagnostic_setting_categories = var.diagnostic_setting_categories
}
