#!/bin/sh
# pod-get-ip.sh
# Get IP Address of Pod
kubectl get pods -l app=my-nginx -o yaml | grep podIP
