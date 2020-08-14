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
