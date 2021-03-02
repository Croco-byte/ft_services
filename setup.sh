#!/bin/bash

# Starting Minikube
minikube start --vm-driver=none

# Installing MetalLB objects and config
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null

# Building our docker images
docker build -t service_nginx ./srcs/nginx/
docker build -t service_wordpress ./srcs/wordpress/
docker build -t service_mysql ./srcs/mysql/
docker build -t service_phpmyadmin ./srcs/phpmyadmin/
docker build -t service_ftps ./srcs/ftps/
docker build -t service_influxdb ./srcs/influxdb/
docker build -t service_grafana ./srcs/grafana/

# Create kubernetes deployments and services
kubectl create -f ./srcs/k8s-objects/
