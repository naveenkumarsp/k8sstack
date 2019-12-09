#! /bin/bash
curl -L https://git.io/get_helm.sh | bash
kubectl apply -f helm_rbac.yam
helm init --service-account=tiller --history-max 300
kubectl get deployment tiller-deploy -n kube-system
