resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_storage_account" "minecraft_data" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "minecraft_share" {
  name                 = "minecraft"
  storage_account_name = azurerm_storage_account.minecraft_data.name
  quota                = 5
}

resource "azurerm_container_group" "minecraft_container" {
  name                = "${var.container_group_name}-cg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = var.dns_prefix
  os_type             = "Linux"
  exposed_port = [{
    port     = 25565
    protocol = "TCP"
  }]
  container {
    name   = var.container_group_name
    image  = "itzg/minecraft-server"
    cpu    = var.cpu
    memory = var.memory
    ports {
      port     = 25565
      protocol = "TCP"
    }
    environment_variables = {
      "EULA"        = "TRUE"
      "INIT_MEMORY" = "${var.memory}G"
      "MAX_MEMORY"  = "${var.memory}G"
      "OPS"         = var.opperator
    }
    volume {
      name                 = "data"
      mount_path           = "/data"
      share_name           = azurerm_storage_share.minecraft_share.name
      storage_account_name = azurerm_storage_account.minecraft_data.name
      storage_account_key  = azurerm_storage_account.minecraft_data.primary_access_key
    }
  }
}
