#!/bin/sh
# pod-exec-mysql.sh
# Execute command show databases
echo "show databases" | kubectl exec -i mysql \
  -- mysql --password=mypassword
