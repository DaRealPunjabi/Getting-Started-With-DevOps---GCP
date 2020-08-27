# Create, View, Delete a Pod

## This post will cover a YAML definition for creating a pod in Kubernetes.

# Define a Pod
Taking the YAML definition apart piece by piece

```
---
apiVersion: v1
kind: Pod
```
>--- The first line is a separator and comes in handy when defining multiple structures in a single file. The apiVersion tells Kubernetes the schema version being used for the definition. The kind is the the type of resource we are creating.

```
metadata:
 name: my-nginx-pod
 labels:
   app: my-app-label
   environment: development
```
>In the metadata, the name of the Pod, as well as the label used to identify the pod to Kubernetes are defined.

```
spec:
 containers:
   – name: my-web-container
     image: nginx
     ports:
       – containerPort: 80
         name: http
         protocol: TCP
```
>Finally, the objects that make up the pod are specified. This includes the name of the container and the image on which the container is based. The containerPort attribute is mandatory it defines the port on which app can be reached out inside the container. The value of the protocol attribute is TCP by default. The name attribute is optional only if there is one port declared.

# Create a Pod
```
kubectl apply -f ./pod/nginx.yaml
```
Output:
```
pod/my-nginx-pod created
```
## Get Information on Running Pods
```
kubectl get pods
```
Output:

```
NAME           READY   STATUS    RESTARTS   AGE
my-nginx-pod   1/1     Running   0          26s
```

## Get more information on pods with specific labels
```
kubectl get pods -l app=my-app-label -o wide
```

## Get pod IP Address
```
kubectl get pods -l app=my-app-label -o yaml | grep podIP
```
Output:
```
podIP: 10.0.1.10
```

## Execute a Command to the Container
The pod IP address is a private address, Execute a command in a container.

<pre>
kubectl exec my-nginx-pod -- curl http://10.0.1.10
<b>Welcome to nginx!</b>
</pre>

## Retrieve Pod Logs
```
kubectl logs my-nginx-pod
```

# Access the Pod

## 1.From local machine using Port Forwarding
```
kubectl port-forward pod/my-nginx-pod 8081:80
```
Run the following command in the terminal:

<pre>
curl localhost:8081
<b>Welcome to nginx!</b>
</pre>

## 2. From another Pod within the Cluster using internal Endpoint

Create a service
```
kubectl expose pod/my-nginx-pod --name=my-service-name \
  --type=NodePort
```

Retrieve the endpoint
<pre>
kubectl describe service my-service-name | grep Endpoints
<b>Endpoints: 10.0.1.10:80</b>
</pre>

Launch another Pod
```
kubectl run debug-pod --image=yauritux/busybox-curl \
  --restart=Never \
  --tty  --stdin --attach --rm \
  --command -- sh
```
**Wait for the Pod to become available** and once the shell prompt appears
<pre>
telnet 10.0.1.10 80          | curl http://10.0.1.10:80
GET /                        | <b>Welcome to nginx!</b>
<b>Welcome to nginx!</b>
</pre>

## 3. From outside the Cluster using external IP Address
Delete the NodePort service
```
kubectl delete service my-service-name
```
Create the LoadBalancer Service
```
kubectl expose pod my-nginx-pod --name=my-service-name \
  --port=80 \
  --target-port=80 \
  --type=LoadBalancer
```
Get the External IP Address
<pre>
kubectl get services
<b>NAME              TYPE           CLUSTER-IP     EXTERNAL-IP
my-service-name   LoadBalancer   10.3.243.234   35.230.134.193</b>
</pre>

Test the service
From the browser, enter http://34.230.134.193/80
>Welcome to nginx!

# Delete the Service/Pod
```
kubectl delete service/my-service-name
kubectl delete pod/my-nginx-pod
```
# Debug Aid
Execute a command in the container
```
kubectl exec pod/my-nginx-pod -- ls  
kubectl exec --stdin --tty pod/my-nginx-pod -- /bin/bash
```

#Attach to a running pod
```
kubectl attach pod/my-nginx-pod -i
```
