#!/bin/bash

kubectl delete --all services
kubectl delete --all deployments
kubectl delete --all configmaps -n metallb-system
kubectl delete --all pvc
kubectl delete --all pv

# To clean persistent volumes on node that are on "Retain" :
# > docker exec -ti minikube /bin/sh
# > rm -rf /pv
