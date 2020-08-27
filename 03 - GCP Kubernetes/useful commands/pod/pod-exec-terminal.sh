#!/bin/sh
# pod-exec-terminal.sh
# Execute command terminal
kubectl exec --stdin --tty pod/my-nginx-pod -- /bin/bash
