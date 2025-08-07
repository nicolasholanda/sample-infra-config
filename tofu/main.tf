resource "helm_release" "prometheus" {
  name       = var.prometheus_release_name
  repository = var.prometheus_chart_repo
  chart      = "prometheus"
  namespace  = var.infra_namespace
  version    = var.prometheus_chart_version
  create_namespace = false
}

resource "helm_release" "grafana" {
  name       = var.grafana_release_name
  repository = var.grafana_chart_repo
  chart      = "grafana"
  namespace  = var.infra_namespace
  version    = var.grafana_chart_version
  create_namespace = false
}
