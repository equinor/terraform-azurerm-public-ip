output "address_id" {
  description = "The ID of this Public IP address."
  value       = azurerm_public_ip.this.id
}

output "address_name" {
  description = "The name of this Public IP address."
  value       = azurerm_public_ip.this.name
}
