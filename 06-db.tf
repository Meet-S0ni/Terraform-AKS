######################################################################
# postgres
resource "null_resource" "postgres" {
  provisioner "local-exec" {
    command = "kubectl apply -f postgres/ -n db"
  }
    depends_on = [
    kubernetes_namespace.namespaces
  ]
}
######################################################################
resource "null_resource" "wait_for_postgres" {
  provisioner "local-exec" {
    command = "bash ./wait_for_postgres.sh"
  }
  depends_on = [
    null_resource.postgres
    ]
}
######################################################################
resource "null_resource" "init-db" {
  provisioner "local-exec" {
    command = "bash ./init_db.sh"
  }
  depends_on = [
    null_resource.wait_for_postgres
    ]
}
######################################################################