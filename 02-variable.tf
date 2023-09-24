# Azure Resource Group Name
variable "resource_group_name" {
  default = "meet-aks-rg"
}

# Azure Kubernetes Cluster Name 
variable "azurerm_kubernetes_cluster" {
  default = "meet-aks"
}

# Subscription for AZ LOGIN
variable "az_subscription" {
  description = "This variable defines the Tag Created by"
  default     = "3bc6c1f7-2126-XXX-8281-19e1a9fXXX"
}

variable "client_id" {
  default = "qw3860cd-3bp3-41s6-afs8-1a####27a70#"
}

variable "client_secret" {
  default = "B_q8Q~cy###oyzR0Wi1kpWl54FxSgxX7buVQwadL"
}

variable "tenant_id" {
  default = "5011##&&#-41eb-4f5f-98e9-c2669652d11e"
}

# Azure Region Location
variable "location" {
  description = "Azure Region where all these resources will be provisioned"
  default     = "East US"
}
#Ingress Availability Zones
variable "orchestrator_version" {
  description = "This variable defines aks version"
  default     = "1.27.3"
}

## AZ
variable "availability_zones" {
  description = "This variable defines the Environment"
  default     = []
}

## VM Size
variable "node_pool" {
  description = "This variable defines the Environment"
  type        = map(any)
  default = {
    d2sv5 = {
      name                = "d2sv5"
      vm_size             = "Standard_D2s_v5"
      node_count          = 0
      max_count           = 1
      min_count           = 0
      enable_auto_scaling = "false"
      zones               = []
      mode                = "User"
      os_disk_size_gb     = 128
      os_disk_type        = "Managed"
      os_type             = "Linux"

      nodepool_label = {
        "wordpress" : "true"
      }
      tags = {
        "Created_by" : "Meet Soni"
      }
    }
    e4sv5 = {
      name                = "e4sv5"
      vm_size             = "Standard_E4s_v5"
      node_count          = 0
      max_count           = 20
      min_count           = 0
      enable_auto_scaling = "false"
      zones               = []
      mode                = "User"
      os_disk_size_gb     = 128
      os_disk_type        = "Managed"
      os_type             = "Linux"

      nodepool_label = {
        "postgres" = "true"
      }
      tags = {
        "Created_by" : "Meet Soni"
      }
    }
  }
}

variable "namespaces" {
  description = "This is list of namespaces"
  type        = list(string)
  default = [
    "web",
    "db",
  ]
}