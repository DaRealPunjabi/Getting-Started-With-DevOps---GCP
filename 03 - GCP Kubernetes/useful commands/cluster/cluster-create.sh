#!/bin/sh
# cluster-create.sh
gcloud container clusters create my-cluster \
  --zone=europe-west2-a \
  --issue-client-certificate \
  --enable-basic-auth
