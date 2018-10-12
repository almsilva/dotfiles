#!/bin/sh

echo "---"
echo "Iptables configuration"
echo "---"
echo "1. Flusing any active rule."
iptables -F

echo "2. Applying rules."
# Loopback traffic (incoming and outgoing) is allowed.
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# --------------------------------------------------------------------------------
# Incoming traffic
# --------------------------------------------------------------------------------

# Drop invalid packages.
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

# Block XMAS attack.
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

# Drop null packages
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# Block SYN-Flood attack.
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# Block incoming PING.
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP

# Allow traffic of connections already established.
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Block any other incoming traffic.
iptables -P INPUT DROP

# --------------------------------------------------------------------------------
# Outgoing traffic
# --------------------------------------------------------------------------------

# Allow outgoing PING.
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

# Allow any other outgoing traffic.
iptables -P OUTPUT ACCEPT

echo "3. Persisting the rules to /etc/sysconfig/iptables."
iptables-save | tee /etc/sysconfig/iptables

echo "4. Restarting iptables services."
systemctl restart iptables

echo "Done!"
