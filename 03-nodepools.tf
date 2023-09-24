data "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "meet-aks"
  resource_group_name = "meet-aks-rg"
}

## create standard nodes
resource "azurerm_kubernetes_cluster_node_pool" "standard_nodes" {

  for_each              = var.node_pool
  zones                 = var.availability_zones
  enable_auto_scaling   = each.value.enable_auto_scaling
  kubernetes_cluster_id = data.azurerm_kubernetes_cluster.aks_cluster.id
  mode                  = each.value.mode
  name                  = "std${each.value.name}"
  node_count            = each.value.node_count
  os_disk_size_gb       = each.value.os_disk_size_gb
  os_disk_type          = each.value.os_disk_type
  os_type               = each.value.os_type
  vm_size               = each.value.vm_size
  priority              = "Regular"
  scale_down_mode       = "Deallocate"
  node_labels           = each.value.nodepool_label
  tags                  = each.value.tags
}