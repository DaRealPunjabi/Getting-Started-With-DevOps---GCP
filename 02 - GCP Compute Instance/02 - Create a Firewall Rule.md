# Create a firewall rule

Create a firewall to control incoming or outgoing traffic to an instance. By default, incoming traffic from outside your network is blocked.

Firewall rules have the following characteristics:
* The direction of connection incoming (ingress) or outgoing (egress) traffic, not both.
* ️A numerical priority, which determines whether the rule is applied. Only the highest rank (lowest priority number) rule whose other components match traffic is applied; conflicting rules with a lower rank are ignored.
* An action on a match, either allow or deny, which determines whether the rule permits or blocks connections.
* A target, which defines the instances to which the rule applies.
* ️A source for ingress rules or a destination for egress rules only support IPv4 connections. When specifying a source for an ingress rule or a destination for an egress rule by address, you can only use an IPv4 address or IPv4 block in CIDR notation.
* The protocol (such as TCP, UDP, or ICMP) and port.
* A firewall rule must select a VPC network

```
gcloud compute firewall-rules create jenkins-allow-ingress \
  --direction=INGRESS \
  --priority=1000 \
  --action=ALLOW \
  --target-tags=http-server,https-server \
  --source-ranges=0.0.0.0/0 \
  --rules=tcp:8080 \
  --network=default
```

## Priority
The firewall rule priority is an integer from 0 to 65535, inclusive. Lower integers indicate higher rank. If you do not specify a priority when creating a rule, it is assigned a priority of 1000.

The highest rank rule applicable to a target for a given type of traffic takes precedence. Target specificity does not matter. For example, a higher rank ingress rule for certain ports and protocols intended for all targets overrides a similarly defined rule for the same ports and protocols intended for specific targets.

# Examine a firewall rule
```
gcloud compute firewall-rules describe jenkins-allow-ingress
```







gcloud compute instances create jenkins-server \
  --zone=us-central1-a \
  --machine-type=n1-standard-1 \
  --image-family=ubuntu-1804-lts \
  --image-project=ubuntu-os-cloud \
  --tags=http-server,https-server

gcloud compute firewall-rules create jenkins-allow-ingress \
  --network=default \
  --action=ALLOW \
  --direction=INGRESS \
  --rules=tcp:8080 \
  --source-ranges=0.0.0.0/0 \
  --priority=1000 \
  --target-tags=http-server,https-server

  gcloud compute firewall-rules create vm1-allow-ingress-tcp-port80-from-subnet1 \
      --network my-network \
      --action allow \
      --direction ingress \
      --rules tcp:80 \
      --source-ranges 10.240.10.0/24 \
      --priority 50 \
      --target-tags webserver

gcloud compute firewall-rules create my-vpc-allow-ssh-icmp \
  --network my-vpc \  
  --allow tcp:22,icmp \
  --source-ranges 0.0.0.0/0

gcloud compute — project=demo-project firewall-rules create instance-1 — direction=INGRESS — priority=1000 — network=default — action=ALLOW — rules=tcp:8080 — source-ranges=0.0.0.0/0 — target-tags=http-server,https-server

  Name: jenkins
  Description: port 8080 for jenkins
  Network: default
  Ingress
  Allow
  Targets: All instances in the network
  IP ranges: 0.0.0.0/0
  tcp: 8080

  —- boot-disk-size=10GB \
  —- boot-disk-type=pd-standard \


  gcloud beta compute — project=demo-project instances create instance-1
   — zone=us-central1-a
   — machine-type=n1-standard-1
   — subnet=default — network-tier=PREMIUM
   — maintenance-policy=MIGRATE —
   — tags=http-server,https-server
   — image=ubuntu-1804-bionic-v20190918 — image-project=ubuntu-os-cloud
   — boot-disk-size=10GB
   — boot-disk-type=pd-standard
   — boot-disk-device-name=instance-1
   — reservation-affinity=any
