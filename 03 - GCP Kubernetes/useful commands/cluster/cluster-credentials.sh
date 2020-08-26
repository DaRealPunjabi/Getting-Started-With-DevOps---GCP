#!/bin/sh
# cluster-credentials.sh
gcloud container clusters get-credentials my-cluster \
  --zone=europe-west2-a
