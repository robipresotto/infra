resource "helm_release" "grafana" {
  chart = "grafana"
  name = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  namespace = "monitoring"
  version = "6.51.5"

  values = [
    templatefile("${path.module}/values/grafana-values.yaml", {
      admin_existing_secret = kubernetes_secret.grafana.metadata[0].name
      admin_user_key = "admin-user"
      admin_password_key = "admin-password"
      prometheus_svc = "${helm_release.prometheus.name}-server"
      influxdb_svc = "${helm_release.influxdb.name}"
      influxdb_auth = "${random_password.influxdb-token.result}"
      influxdb_org = "${local.influxOrg}"
      replicas = 1
    })
  ]

  depends_on = [
    helm_release.influxdb
  ]

}