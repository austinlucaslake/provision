#!/bin/sh

sudo apt install -y --no-install-recommends ansible
ansible-galaxy collection install community.general community.crypto
curl https://raw.githubusercontent.com/austinlucaslake/provision/main/provision.yaml | ansible-playbook /dev/stdin -e "token=$1 sshpassphrase=$2 gpgpassphrase=$3"
