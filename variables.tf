variable "name" {
  description = "(Required) The name of the network security group."
  default     = "default-subnet-tf"
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which the network security group will be created."
  type        = string
}

variable "location" {
  description = "(Required) The location of the network security group."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "(Required) Id of a log analytics workspace for diagnostic setting."
  type = string
}

variable "security_rules" {
  description = "(Optional) List of rules for the network security group."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = null
}
