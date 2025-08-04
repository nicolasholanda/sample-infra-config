output "prometheus_url" {
  value       = "http://prometheus-server.${var.infra_namespace}.svc.cluster.local"
  description = "Cluster-internal Prometheus URL"
}

output "grafana_url" {
  value       = "http://grafana.${var.infra_namespace}.svc.cluster.local"
  description = "Cluster-internal Grafana URL"
}

data "kubernetes_secret" "grafana_admin" {
  metadata {
    name      = "grafana"
    namespace = var.infra_namespace
  }
}

output "grafana_admin_password" {
  value       = base64decode(data.kubernetes_secret.grafana_admin.data["admin-password"])
  description = "Grafana admin password"
  sensitive   = true
}
