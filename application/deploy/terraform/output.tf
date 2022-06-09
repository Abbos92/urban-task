output "ExternalIP" {
  value = [kubernetes_service.urban_service.status.0.load_balancer.0.ingress.0.ip]
}