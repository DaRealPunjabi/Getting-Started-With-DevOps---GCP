#!/bin/sh
# pod-create-sh.sh
# Launch a terminal pod
kubectl run debug-pod --image=yauritux/busybox-curl \
  --restart=Never \
  --tty  --stdin --attach --rm \
  --command -- sh
