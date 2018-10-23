# Allow traffic to Docker.
iptables -A OUTPUT -p tcp --dport 5432 -j ACCEPT

# Allow traffic to Redis.
iptables -A OUTPUT -p tcp --dport 6379 -j ACCEPT
