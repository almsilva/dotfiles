#!/bin/sh

# Allow ICMP Echo request.
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
