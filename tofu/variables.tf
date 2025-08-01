variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "kube_context" {
  description = "Kubernetes context to use"
  type        = string
  default     = ""
}

variable "infra_namespace" {
  description = "Namespace for infrastructure components"
  type        = string
  default     = "infra"
}

variable "prometheus_release_name" {
  description = "Helm release name for Prometheus"
  type        = string
  default     = "prometheus"
}

variable "grafana_release_name" {
  description = "Helm release name for Grafana"
  type        = string
  default     = "grafana"
}

variable "prometheus_chart_version" {
  description = "Prometheus chart version"
  type        = string
  default     = "25.21.0"
}

variable "grafana_chart_version" {
  description = "Grafana chart version"
  type        = string
  default     = "7.3.10"
}

variable "prometheus_chart_repo" {
  description = "Prometheus Helm repo"
  type        = string
  default     = "https://prometheus-community.github.io/helm-charts"
}

variable "grafana_chart_repo" {
  description = "Grafana Helm repo"
  type        = string
  default     = "https://grafana.github.io/helm-charts"
}
