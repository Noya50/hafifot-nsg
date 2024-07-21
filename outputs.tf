output "name" {
  value       = azurerm_network_security_group.this.name
  description = "The name of the network security group."
}

output "resource_group_name" {
  value       = azurerm_network_security_group.this.resource_group_name
  description = "The name of the resource group of the network security group."
}

output "location" {
  value       = var.location
  description = "The location of the network security group"
}

output "id" {
  value       = azurerm_network_security_group.this.id
  description = "The id of the network security group."
}
