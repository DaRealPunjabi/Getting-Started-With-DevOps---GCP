#!/bin/sh
# pod-expose-cluster.sh
# Create a new service, exposed to within cluster
kubectl expose pod/my-nginx-pod --name=my-service-name \
  --type=NodePort
