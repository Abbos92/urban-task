output "cluster-endpoint" {
  value = nonsensitive(module.gke.endpoint)
}