# deploy wordpress using manifests 
resource "null_resource" "wordpress" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./wordpress -n web"
  }
  depends_on = [
    null_resource.init-db
    ]
}