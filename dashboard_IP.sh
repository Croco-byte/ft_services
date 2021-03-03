#!/bin/bash

IP=$(sudo kubectl get svc/kubernetes-dashboard -n kubernetes-dashboard -o jsonpath='{.spec.clusterIP}')

echo "Open in browser :		http://$IP/"
