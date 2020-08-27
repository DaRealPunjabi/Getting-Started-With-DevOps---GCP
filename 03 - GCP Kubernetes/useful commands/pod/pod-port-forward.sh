#!/bin/sh
# pod-port-forward.sh
# Expose pod port to your local machine
kubectl port-forward pod/my-nginx-pod 8081:80
