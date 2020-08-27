#!/bin/sh
# pod-expose-external.sh
# Create a new service, exposed to external IP
kubectl expose pod my-nginx-pod --name=my-service-name \
  --port=80 \
  --target-port=80 \
  --type=LoadBalancer
