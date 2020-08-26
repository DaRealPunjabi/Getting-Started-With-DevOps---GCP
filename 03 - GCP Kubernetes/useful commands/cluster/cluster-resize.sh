#!/bin/sh
# cluster-resize.sh
gcloud container clusters resize my-cluster \
  --zone=europe-west2-a \
  --num-nodes=1
