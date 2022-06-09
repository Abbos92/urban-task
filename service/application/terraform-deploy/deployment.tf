resource "kubernetes_deployment" "urban_deploy" {
  metadata {
    name = "urban-test-app"
    labels = {
      app = "UrbanTestApp"
    }
    namespace = kubernetes_namespace.urban.id

  }
  spec {

    replicas = 3
    selector {
      match_labels = {
        app = "UrbanTestApp"
      }
    }
    template {
      metadata {
        labels = {
          app = "UrbanTestApp"
        }
      }
      spec {
        container {
          name  = "urban-test-app"
          image = "saridor/urban-test"
          resources {
            limits = {
              memory = "128Mi"
              cpu    = "500m"
            }
          }
          port {
            container_port = 3000
          }
          #   liveness_probe {
          #     http_get {
          #       path = "/"
          #       port = 3000

          #       http_header {
          #         name  = "X-Custom-Header"
          #         value = "Awesome"
          #       }
          #     }

          # initial_delay_seconds = 3
          # period_seconds        = 3
          #   }
        }
      }
    }
  }
}