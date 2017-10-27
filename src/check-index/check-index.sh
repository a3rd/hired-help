#!/bin/bash
#echo "Note: Group does not need path, hosts does need path\n"
iptables_log="/etc/ansible/logs/iptables.log"

inventory="/etc/ansible/hosts"
hosts="webservers"

http_ports="iptables -C INPUT -p tcp --dport 80 --jump ACCEPT"

echo "Ansible inventory: " $inventory
echo "Ansible hosts: " $hosts

#ansible webservers -i /etc/ansible/hosts -m command -a 'cat /var/www/html/inde$

echo "DISPLAY STATUS OF NETWORK SERVICES"
net_services="/etc/ansible/roles/setup.yml"
ansible-playbook $net_services

echo "CHECK IPTABLES"
ansible $hosts -i $inventory -m command -a 'iptables --list' | tee -a "$iptable$
echo "iptables logged to " $iptables_log

echo "LOG INDEX.HTML FILE"
ansible $hosts -i $inventory -m command -a 'cat /var/www/html/index.html'



