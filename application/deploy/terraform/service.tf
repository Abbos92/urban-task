resource "kubernetes_service" "urban_service" {
  metadata {
    name = "urban-test-service"
    labels = {
      "test" = "UrbanTestApp"
    }
    namespace = kubernetes_namespace.urban.id
  }
  spec {
    selector = {
      app = kubernetes_deployment.urban_deploy.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}