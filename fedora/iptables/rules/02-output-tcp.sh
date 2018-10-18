#!/bin/sh

# Configure the output rules.
iptables -P OUTPUT DROP

# Allow loopback traffic.
iptables -A OUTPUT -o lo -j ACCEPT

# Allow HTTP/HTTPS.
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 8080 -j ACCEPT

# Allow FTP, FTP Control, FTPS, SSH, Telnet and Telnet over TLS.
iptables -A OUTPUT -p tcp --dport 20 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 989 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 990 -j ACCEPT
iptables -A OUTPUT -p TCP --dport 22 -j ACCEPT
iptables -A OUTPUT -p TCP --dport 23 -j ACCEPT
iptables -A OUTPUT -p TCP --dport 992 -j ACCEPT

# Allow POP3, POPS3, SMTP, SMTPS, IMAP and IMAPS.
iptables -A OUTPUT -p tcp --dport 25 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 995 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 110 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 465 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 220 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 993 -j ACCEPT

# Allow NTP and NTPS.
iptables -A OUTPUT -p tcp --dport 123 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 563 -j ACCEPT

# Allow DHCP client.
iptables -A OUTPUT -p tcp --dport 547 -j ACCEPT

# Allow DNS and DNS over TLS.
iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 853 -j ACCEPT

# Allow NFS.
iptables -A OUTPUT -p tcp --dport 2049 -j ACCEPT

# Allow Skype.
iptables -A OUTPUT -p tcp --dport 23399 -j ACCEPT

# Allow Spotify.
iptables -A OUTPUT -p tcp --dport 4070 -j ACCEPT

# Allow Tor.
iptables -A OUTPUT -p tcp --dport 9001 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 9030 -j ACCEPT

# Allow git.
iptables -A OUTPUT -p tcp --dport 9418 -j ACCEPT

# Allow Samba Client.
iptables -A OUTPUT -p tcp --match multiport --dports 137:139 -j ACCEPT # Netbios
iptables -A OUTPUT -p tcp --dport 389 -j ACCEPT # LDAP
iptables -A OUTPUT -p tcp --dport 445 -j ACCEPT # Windows AD (optional)
