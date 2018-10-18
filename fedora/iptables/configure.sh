#!/bin/sh

echo "---"
echo "Iptables configuration"
echo "---"

echo "1. Flusing any active rule."
iptables -F

echo "2. Applying rules."
for entry in "./rules/"*
do
  echo "  * Applying rules from file: $entry..."
  sh "$entry"
done

echo "3. Persisting the rules to /etc/sysconfig/iptables."
iptables-save | tee /etc/sysconfig/iptables

echo "4. Restarting iptables services."
systemctl restart iptables

echo "Done!"
