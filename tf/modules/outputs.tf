output "server_uri" {
  value = azurerm_container_group.minecraft_container.fqdn
}
