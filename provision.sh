#!/bin/sh

HELP_MESSAGE="
Debian provisioning script.

Syntax: provision.sh -t TOKEN -s SSH_PASSPHRASE -g GPG_PASSPHRASE -d

If no SSH passhrase is provided, the playbook won't generate an SSH keypair for the machine.
If no GPG passhrase is provided, the playbook won't generate an GPG keypair for the machine.
To ensure any generated SSH or GPG keys are added to GitHub, a valid token must be provided.

options:
    h | help              Print this help message.
    t | token             GitHub personal access token.
    s | ssh-passphrase    Passphrase for generated SSH keypair.
    g | gpg-passphrase    Passphrase for generated GPG keypair.
    d | desktop           Install flag for desktop applications.
"

TOKEN=""
SSH_PASSPHRASE=""
GPG_PASSPHRASE=""
DESKTOP="false"

options=$(getopt -o "ht:s:g:d" -l "help,token:,ssh_passphrase:,gpg_passphrase:,desktop" -- "$@")
if [ $? -ne 0 ]; then
    echo "Invalid arguments." >&2
    exit 1
fi
eval set -- "$options"

while [ $# -gt 0 ]; do
    case "$1" in
        -h | --help ) echo "$HELP_MESSAGE"; exit;;
        -t | --token ) TOKEN="$2"; shift 2;;
        -s | --ssh-passphrase ) SSH_PASSPHRASE="$2"; shift 2;;
        -g | --gpg-passphrase ) GPG_PASSPHRASE="$2"; shift 2 ;;
        -d | --desktop ) DESKTOP=true; shift;;
        -- ) shift; break;;
    esac
done

sudo apt -y --no-install-recommends install ansible curl
ansible-galaxy collection install community.general community.crypto
curl -sS https://raw.githubusercontent.com/austinlucaslake/provision/main/provision.yaml | ansible-playbook /dev/stdin -K -e "{'token':$TOKEN, 'ssh_passphrase': $SSH_PASSPHRASE, 'gpg_passphrase': $GPG_PASSPHRASE, 'desktop': $DESKTOP}" 
