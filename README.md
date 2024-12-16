# Jon's Dev Container Features

This repository contains a collection of Dev Container features that I find useful.

I based this repo on the [devcontainers/feature-starter template](https://github.com/devcontainers/feature-starter) which came with the MIT License, so the content here is offered
under the same license.

## Contents

### `keyring`

This feature provides `sagecipher` and `keyring`, to enable you to encrypt/decrypt files in your container.

- [sagecipher](https://pypi.org/project/sagecipher/) provides an AES cipher, whose key is obtained by signing nonce data via SSH agent.
- [keyring](https://pypi.org/project/keyring/) is configured to use the keyring managed by sagecipher.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/jon-hedgerows/decontainer-features/keyring:1": {}
    }
}
```

```bash
$ keyring --help
usage: keyring [-h] [-p KEYRING_PATH] [-b KEYRING_BACKEND] [--list-backends] [--disable] [--mode {password,creds}]
               [--output {plain,json}] [--print-completion {bash,zsh,tcsh}]
               [{get,set,del,diagnose}] [service] [username]

positional arguments:
  {get,set,del,diagnose}
  service
  username

options:
  -h, --help            show this help message and exit
  -p KEYRING_PATH, --keyring-path KEYRING_PATH
                        Path to the keyring backend
  -b KEYRING_BACKEND, --keyring-backend KEYRING_BACKEND
                        Name of the keyring backend
  --list-backends       List keyring backends and exit
  --disable             Disable keyring and exit
  --mode {password,creds}
                        Mode for 'get' operation. 'password' requires a username and will return only the password. 'creds' does not
                        require a username and will return both the username and password separated by a newline. Default is
                        'password'
  --output {plain,json}
                        Output format for 'get' operation. Default is 'plain'
  --print-completion {bash,zsh,tcsh}
                        print shell completion script
```
