#!/bin/sh
# cluster-delete.sh
gcloud container clusters delete my-cluster \
  --zone=europe-west2-a \
  --async --quiet
