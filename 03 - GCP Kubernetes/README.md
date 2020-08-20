# Google Kubernetes

Kubernetes is a container orchestration system that helps deploy and manage containerised applications.

## The Kubernetes Cluster
Kubernetes cluster is a set of node machines for running containerised applications. At a minimum, a cluster contains a control plane and one or more worker nodes.

## The Kubernetes Master Node
Kubernetes is a set of tools and scripts that help to host containers (Docker hosts) in an environment. <br />

The master node is the cluster control panel or control plane. It is a collection of processes that control Kubernetes nodes. This is where all decisions are made, such as scheduling, and detecting/responding to events.

* API Server ~ is the front end for Kubernetes, The users, management devices and the (kubectl) command-line interface communicate with the API server to interact with Kubernetes.
* ETCD ~ is a distributed key-value store for data used to manage the cluster containing information configuration management, service discovery and logs to ensure that there are no conflicts between the nodes.
* Scheduler ~ is responsible for distributing the work (containers) across multiple nodes.
* Controller Manager ~is responsible for noticing when nodes, containers go down and for making the decision to bring up new nodes and container.

## Nodes
This is the virtual machine. Nodes are worker servers that perform the requested tasks i.e. run the application(s) assigned by the control plane.

* Kubelet ~ is responsible for making sure the containers are running as expected. 
* Kube-proxy It is responsible for routing traffic to the appropriate container based on IP and port number of the incoming request.

## Pod
A pod defines the logical unit of the application. It is a group of one or more containers with shared storage/network resources deployed to a single node. Each pod contains specific information on how containers should be run.

## Container Runtime
The software used to run the container e.g. Docker

## Container
A container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries, and settings. Container images become containers at runtime.

## Deployment
A deployment ensures the desired number of pods are running and available at all times automatically replacing any instances that fail or become unresponsive.

## Features
Description of important features.

### Kubernetes Cluster
 * [Create a Kubernetes Cluster](<01 - Create a Kubernetes Cluster.md>)
