resource "kubernetes_namespace" "urban" {
  metadata {
    annotations = {
      name = "urban-namespaces"
    }
    name = var.appNamespace
  }
}