# Create a Kubernetes Cluster

# Prerequisite
The following instruction requires GCP account, GCP Project and 
Kubernetes Engine API enabled. A Docker image saved locally, see article: https://github.com/DaRealPunjabi/Getting-Started-With-DevOps---Docker/tree/master/03%20-%20nginx%20Hello%20World

# Create the Kubernetes Cluster
In the browser cloud console, select the required project and click on the SSH button to open an ssh terminal.

## Create a single node cluster
Enter the following commands in the ssh terminal
```
gcloud container clusters create my-cluster \
  --zone=europe-west2-a \
  --num-nodes=1
```

## Fetch credentials for a running cluster
Update the kubeconfig file with appropriate credentials and endpoint information to point kubectl at a specific cluster in Google Kubernetes Engine
```
gcloud container clusters get-credentials my-cluster \
  --zone=europe-west2-a
```
## To list available nodes in your cluster
```
kubectl get nodes
```
Output:
```
NAME                                        STATUS
gke-my-cluster-default-pool-b752c333-7ljn   Ready
```
### Explicitly tagging an image through the tag command
Creates an alias (a reference) by the name of the TARGET_IMAGE that refers to the SOURCE_IMAGE
```
docker tag darealpunjabi:version1 us.gcr.io/darealpunjabi-20200813/darealpunjabi:version1
```
## Share your images to the GCP project container registry
Container registry provides secure, private Docker image storage on Google Cloud Platform. The container registry need to be enabled, see link https://cloud.google.com/container-registry/docs/pushing-and-pulling
```
docker push us.gcr.io/darealpunjabi-20200813/darealpunjabi:version1
```
## Create the deployment
Now we can create a pod that gets scheduled on the node. Kubernetes represents applications as pods, which are scalable units holding one or more containers. The Pod is the smallest deployable unit in Kubernetes.
```
kubectl create deployment my-web-server \
  --image=us.gcr.io/darealpunjabi-20200813/darealpunjabi:version1
```
## To see the pods created
```
kubectl get pods
```
Output:
```
NAME                             READY   STATUS    RESTARTS   AGE
my-web-server-5cb9fc4f79-cswqh   1/1     Running   0          2d1h
```
## Create a Service object that exposes the deployment
To expose a Kubernetes Service outside the cluster, you will create a Service of type LoadBalancer. This type of Service spawns an External Load Balancer IP for a set of Pods, reachable via the internet.
```
kubectl expose deployment my-web-server \
  -- type=LoadBalancer \
  -- port=80 \
  -- target-port=80
```
## Get the external IP Address
```
kubectl get service my-web-server
```
Output:
```
NAME.           TYPE           EXTERNAL-IP     PORT(S)        AGE
my-web-server   LoadBalancer   34.155.221.38   80:32531/TCP   2d15h
```

## Test the deployment
From the browser, enter http://34.155.221.38/80
>Hello, World! - DaRealpunjabi  <br />
