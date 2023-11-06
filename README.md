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

`sudo apt install -y curl && curl https://raw.githubusercontent.com/austinlucaslake/provision/main/provision.sh | sh -s --`

## Note

The one-liner above should also function as a means of updating a system
