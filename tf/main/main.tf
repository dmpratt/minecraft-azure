# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

module "minecraft" {
  source = "../modules"

  location             = "centralus"
  resource_group       = "YourNewResourceGroup"
  storage_name         = "minecraftdata0101101"
  container_group_name = "minecraft"
  dns_prefix           = "my-minecraft-server"
  opperator            = "mojang username"
  cpu                  = "1"
  memory               = "2"
}

output "server_uri" {
  value = module.minecraft.server_uri
}
