# learning-rosa

## Prerequisites
- terraform or tofu binary
- oc
- kubectl
- OpenShift Local (CRC)

## Create resources for DevSpaces

## login to argocd
```
GITOPS_HOST=$(oc get routes -n openshift-gitops openshift-gitops-server -o jsonpath='{.status.ingress[0].host}')
argocd login ${GITOPS_HOST} --sso
```
## Create an Argo Application
argocd app create devspaces --repo https://github.com/anandf/learning-rosa.git --path devspaces --revision main --dest-namespace devspaces --dest-server https://kubernetes.default.svc --sync-policy automated --self-heal --sync-option CreateNamespace=true
