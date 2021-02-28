#!/bin/bash

kubectl delete --all services
kubectl delete --all deployments
kubectl delete --all configmaps -n metallb-system
kubectl delete --all pvc
kubectl delete --all pv
