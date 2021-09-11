variable "location" {
  description = "Azure location to use"
  type        = string
  default     = "centralus"
}

variable "resource_group" {
  description = "Name of Azure resource group to create"
  type        = string
}

variable "storage_name" {
  description = "Name of Azure storage account to create"
  type        = string
}

variable "container_group_name" {
  description = "Name of Azure container group to create"
  type        = string
}

variable "dns_prefix" {
  default = "Prefix for public dns address of container."
  type    = string
}

variable "opperator" {
  description = "Default assigned opperator (Minecraft account name)"
  type        = string
}

variable "cpu" {
  description = "Number of virtual cpus to assign."
  type        = string
  default     = "1"
}

variable "memory" {
  description = "Max memory in gigabytes."
  type        = string
  default     = "2"
}
