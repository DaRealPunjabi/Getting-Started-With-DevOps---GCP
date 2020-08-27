#!/bin/sh
# pod-exec-curl.sh
# Execute command curl
kubectl exec pod/my-nginx-pod -- curl http://10.0.1.10
