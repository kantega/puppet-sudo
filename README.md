# Sudo

Simple module for handling sudo rules.

## About

This module only cares about stuff underneath `/etc/sudoers.d` and won't touch `/etc/sudoers` at all.

This module will be default _purge_ anything in `/etc/sudoers.d` that is not managed by Puppet.

## Usage

Hiera example:

```
sudo::rules:
  'monitoring'
    description: 'Sudo rules for monitoring agent'
    rules:
      - 'mon ALL=(ALL) NOPASSWD: /usr/local/bin/check_script1'
      - 'mon ALL=(ALL) NOPASSWD: /usr/local/bin/check_script2'
  'admins':
    description: 'Admins should be able to become root':
    rules:
      - '%admins ALL=(ALL) NOPASSWD: /usr/bin/su'
```
