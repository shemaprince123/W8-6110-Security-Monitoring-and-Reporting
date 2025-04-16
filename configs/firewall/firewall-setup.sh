#!/bin/bash

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Set up basic firewall rules
iptables -F
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow established and related connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow internal traffic
iptables -A INPUT -i eth0 -s 172.20.0.0/16 -j ACCEPT
iptables -A FORWARD -i eth0 -s 172.20.0.0/16 -j ACCEPT

# Allow only specific traffic from DMZ
iptables -A FORWARD -i eth1 -s 172.30.0.0/16 -d 172.20.0.0/16 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -i eth1 -s 172.30.0.0/16 -d 172.20.0.0/16 -p tcp --dport 22 -j ACCEPT

# NAT for internal network
iptables -t nat -A POSTROUTING -s 172.20.0.0/16 -o eth1 -j MASQUERADE

# Log dropped packets
iptables -A INPUT -j LOG --log-prefix "DROPPED INPUT: " --log-level 4
iptables -A FORWARD -j LOG --log-prefix "DROPPED FORWARD: " --log-level 4

# Keep the container running
tail -f /dev/null