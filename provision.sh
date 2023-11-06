#!/bin/sh

sudo apt install -y ansible
ansible-galaxy collection install community.general community.crypto
curl https://raw.githubusercontent.com/austinlucaslake/provision/main/provision.yaml | ansible-playbook /dev/stdin 
