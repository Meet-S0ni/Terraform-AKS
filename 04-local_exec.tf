##########################################################################
resource "null_resource" "azure_cli" {
  triggers = {
    #key = tls_private_key.key.private_key_pem
  }

  provisioner "local-exec" {
    command = "az account set --subscription ${var.az_subscription}; az aks get-credentials --admin --resource-group ${var.resource_group_name} --name ${var.azurerm_kubernetes_cluster} --overwrite-existing"
  }
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}
##########################################################################