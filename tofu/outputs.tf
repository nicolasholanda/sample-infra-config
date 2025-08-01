output "prometheus_url" {
  value = "http://prometheus-server.${var.infra_namespace}.svc.cluster.local"
  description = "Cluster-internal Prometheus URL"
}

output "grafana_url" {
  value = "http://grafana.${var.infra_namespace}.svc.cluster.local"
  description = "Cluster-internal Grafana URL"
}

output "grafana_admin_password" {
  value       = helm_release.grafana.status[0].resources["Secret"]["grafana"].data["admin-password"]
  description = "Grafana admin password (base64 encoded, decode to use)"
  sensitive   = true
}
