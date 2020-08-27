#!/bin/sh
# service-describe-endpoint.sh
# Describe one service, Get Endpoints
kubectl describe service/my-service-name | grep Endpoints
