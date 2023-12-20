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
GITOPS_PASSWORD=$(oc get secret -n openshift-gitops openshift-gitops-cluster -o jsonpath='{.data.admin\.password}' | base64 -d)
argocd login ${GITOPS_HOST} --user admin --password ${GITOPS_PASSWORD} --insecure
```
## Create an Argo Application
argocd app create devspaces --repo https://github.com/anandf/learning-rosa.git --path devspaces --revision main --dest-namespace devspaces --dest-server https://kubernetes.default.svc --sync-policy automated --self-heal --sync-option CreateNamespace=true
