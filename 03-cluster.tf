# Azure Resource Group Name
resource "azurerm_resource_group" "aks_rg" {
  name = var.resource_group_name
  location = var.location
}

### Datasource to get Latest Azure AKS latest Version ###
data "azurerm_kubernetes_service_versions" "current" {
  location = azurerm_resource_group.aks_rg.location
  version_prefix  = 1.27
}

# Azure Kubernetes Cluster Resource
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                   =  var.azurerm_kubernetes_cluster
  location               =  azurerm_resource_group.aks_rg.location
  resource_group_name    =  azurerm_resource_group.aks_rg.name
  dns_prefix             =  "${azurerm_resource_group.aks_rg.name}-cluster"
  kubernetes_version     =  data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group    =  "${azurerm_resource_group.aks_rg.name}-nrg"
#  
  default_node_pool {
    name                 = "system"
    node_count           = 1
    vm_size              = "Standard_DS2_v5"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    os_disk_size_gb      = 128
    type                 = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type"    = "system"
      "nodepoolos"       = "linux"
      "app"              = "system-apps"
      "createdby"        = "${var.created_by}"
    } 
    tags = {
      "nodepool-type"    = "system"
      "nodepoolos"       = "linux"
      "app"              = "system-apps"
      "Created by"  	   = "${var.created_by}"
      "Creation Date"  	 = "$date"
    } 
  }
	
  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true 

# Network Profile
network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }
  
  tags = {
    "Environment"   = "${var.environment}"
    "Created by"    = "${var.created_by}"
  }
}

####################################################################################

# Create Virtual Network
resource "azurerm_virtual_network" "aksvnet" {
  name                = "aks-vnet"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  address_space       = ["10.0.0.0/8"]
}

# Create a Subnet for AKS
resource "azurerm_subnet" "aks-default" {
  name                 = "aks-default-subnet"
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  resource_group_name  = azurerm_resource_group.aks_rg.name
  address_prefixes     = ["10.1.0.0/16"]
}