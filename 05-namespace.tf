# Create namespaces
resource "kubernetes_namespace" "namespaces" {
  for_each = toset(var.namespaces)

  metadata {
    name = each.key
  }
  depends_on = [
    azurerm_kubernetes_cluster_node_pool.standard_nodes
    ]
}
###############################################
