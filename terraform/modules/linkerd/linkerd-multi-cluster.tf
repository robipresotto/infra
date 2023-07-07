resource "helm_release" "linkerd-multi-cluster" {
  chart            = "linkerd-multicluster"
  name            = "linkerd-multicluster"
  repository    = "https://helm.linkerd.io/stable"
  namespace  = "linkerd"
  version         = "30.7.5"

  depends_on = [
    helm_release.linkerd-plane
  ]
}