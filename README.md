# learning-rosa

## Prerequisites
- terraform or tofu binary
- oc
- OpenShift Local (CRC) (if testing it locally on a laptop)

## Run the terraform scripts to install the OpenShift GitOps Operator
```
git clone git@github.com:anandf/learning-rosa.git
cd learning-rosa/terraform
```
```
terraform init
terraform apply -auto-approve
```
#### or
```
tofu init
tofu apply -auto-approve
```
## Create resources for DevSpaces using GitOps

## Login to argocd instance
```
GITOPS_HOST=$(oc get routes -n openshift-gitops openshift-gitops-server -o jsonpath='{.status.ingress[0].host}')
GITOPS_PASSWORD=$(oc get secret -n openshift-gitops openshift-gitops-cluster -o jsonpath='{.data.admin\.password}' | base64 -d)
argocd login ${GITOPS_HOST} --user admin --password ${GITOPS_PASSWORD} --insecure
```
## Create an Argo Application
argocd app create devspaces --repo https://github.com/anandf/learning-rosa.git --path devspaces --revision main --dest-namespace devspaces --dest-server https://kubernetes.default.svc --sync-policy automated --self-heal --sync-option CreateNamespace=true
