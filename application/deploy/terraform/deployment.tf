resource "kubernetes_deployment" "urban_deploy" {
  metadata {
    name = "urban-test-app"
    labels = {
      app = var.appName
    }
    namespace = kubernetes_namespace.urban.id

  }
  spec {

    replicas = var.appReplicas
    selector {
      match_labels = {
        app = var.appName
      }
    }
    template {
      metadata {
        labels = {
          app = var.appName
        }
      }
      spec {
        container {
          name  = "urban-test-app"
          image = var.appImage
          resources {
            limits = {
              memory = var.appResource.memory
              cpu    = var.appResource.cpu
            }
          }
          port {
            container_port = 3000
          }
          liveness_probe {
            http_get {
              path = "/"
              port = 3000

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}