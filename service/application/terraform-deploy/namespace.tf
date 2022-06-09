resource "kubernetes_namespace" "urban" {
  metadata {
    annotations = {
      name = "urban-namespaces"
    }
    name = "prod"
  }
}