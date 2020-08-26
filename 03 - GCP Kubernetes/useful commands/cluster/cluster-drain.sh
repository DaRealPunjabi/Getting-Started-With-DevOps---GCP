#!/bin/sh
# cluster-drain.sh
gcloud container clusters resize my-cluster \
  --zone=europe-west2-a \
  --num-nodes=0
