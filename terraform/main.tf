resource "kubernetes_manifest" "openshift-gitops-subscription" {
  manifest = {
    apiVersion = "operators.coreos.com/v1alpha1"
    kind       = "Subscription"

    metadata = {
      name = "openshift-gitops-operator"
      namespace = "openshift-gitops-operator"
    }

    spec = {
      channel= "gitops-1.11"
      installPlanApproval = "Automatic"
      name= "openshift-gitops-operator"
      source=  "redhat-operators"
      sourceNamespace = "openshift-marketplace"
      config = {
        env = [{
          name = "DISABLE_DEFAULT_ARGOCD_INSTANCE"
          value = "false"
        }]
      }
    }
  }  
  lifecycle {
    ignore_changes = []
  }
}