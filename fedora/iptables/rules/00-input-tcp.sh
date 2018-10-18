#!/bin/sh

# Define the policy.
iptables -P INPUT DROP

# Allow loopback traffic.
iptables -A INPUT -i lo -j ACCEPT

# Drop invalid packages.
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# Block XMAS attack.
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

# Drop null packages (port scan).
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# Block SYN-Flood.
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# Allow traffic of connections already established.
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
