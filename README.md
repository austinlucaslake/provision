# provision

Automated Debian setup process

[![Latest Release][release-badge]][release-url]
[![License][license-badge]](LICENSE)
[![CI Status][ci-badge]][ci-url]

[release-badge]: https://img.shields.io/github/v/release/austinlucaslake/provision
[release-url]: https://github.com/austinlucaslake/provision/releases/latest
[license-badge]: https://img.shields.io/github/license/austinlucaslake/provision
[ci-badge]: https://github.com/austinlucaslake/provision/actions/workflows/ci.yaml/badge.svg
[ci-url]: https://github.com/austinlucaslake/provision/actions

## Provising Script

To provision a new Debian-based system, please run the following command:

`sudo apt install -y --no-install-recommends curl ansible && curl https://raw.githubusercontent.com/austinlucaslake/provision/main/provision.yaml | ansible-playbook /dev/stdin -bK -e "token=PERSONAL_ACCESS_TOKEN sshpassphrase=SSH_PASSPHRASE gpgpassphrase=GPG_PASSPHRASE"`

## Note

The keyword `PERSONAL_ACCESS_TOKEN` must be replaced with your GitHub Personal Access Token to authentication purposes.
The keyword `SSH_PASSPHRASE` must be replaced with a new password to create an SSH key.
The keyword `GPG_PASSPHRASE` must be replaced with a new password to create an GPG key.
