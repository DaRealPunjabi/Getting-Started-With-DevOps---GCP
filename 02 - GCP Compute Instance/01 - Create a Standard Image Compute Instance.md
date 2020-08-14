# Create a Standard Image Compute Instance

Create a general-Purpose standard machine with Ubuntu 18.04 LTS and 10GB of a standard persistent disk.

Run the following command in the terminal:

```
gcloud compute instances create jenkins-server \
  --zone=us-central1-a \
  --machine-type=n1-standard-1 \
  --image-family=ubuntu-1804-lts \
  --image-project=ubuntu-os-cloud \
  --tags=http-server,https-server
```
