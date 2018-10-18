#!/bin/sh

# Block ping request.
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP 
