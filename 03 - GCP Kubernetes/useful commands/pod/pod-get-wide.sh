#!/bin/sh
# pod-get-wide.sh
# Get information (format wide) about running pods
kubectl get pods -l app=my-app-label -o wide
