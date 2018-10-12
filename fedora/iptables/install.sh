#!/bin/sh

echo "This script will install the iptables services (ipv4 and ipv6), enable them and "
echo "initialize them. However, no rule will be added by this script."
echo "You will need to execute it with root privileges."

echo "1. Installing the required services."
dnf install -y iptables-services

echo "2. Enabling services to start automatically."
systemctl enable iptables

echo "3. Starting services."
systemctl start iptables.

echo "Done. Now execute the *configure.sh* script to define the firewall rules."
