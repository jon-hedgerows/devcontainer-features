# Jon's Dev Container Features

This repository contains a collection of Dev Container features that I find useful.

I based this repo on the [devcontainers/feature-starter template](https://github.com/devcontainers/feature-starter) which came with the MIT License, so the content here is offered
under the same license.

## Contents

### `bws`

This feature provides `bws`, the Bitwarden Secrets CLI, from https://github.com/bitwarden/sdk-sm

```jsonc
"features": {
    "ghcr.io/jon-hedgerows/decontainer-features/bws:1": {}
}
```

The intent is to keep the feature version aligned with the bws version.  This feature requires an update
each time bws is updated, so any particular version is not guaranteed to be available.

For `bws` help, please see https://bitwarden.com/help/secrets-manager-cli/

```shell
$ bws help
Bitwarden Secrets CLI

Usage: bws [OPTIONS] [COMMAND]

Commands:
  config       Configure the CLI
  completions  Generate shell completion files
  project      Commands available on Projects
  secret       Commands available on Secrets
  run          Run a command with secrets injected
  help         Print this message or the help of the given subcommand(s)

Options:
  -o, --output <OUTPUT>              Output format [default: json] [possible values: json, yaml, env, table, tsv, none]
  -c, --color <COLOR>                Use colors in the output [default: auto] [possible values: no, yes, auto]
  -t, --access-token <ACCESS_TOKEN>  Specify access token for the service account [env: BWS_ACCESS_TOKEN]
  -f, --config-file <CONFIG_FILE>    [default: ~/.config/bws/config] Config file to use [env: BWS_CONFIG_FILE=]
  -p, --profile <PROFILE>            Profile to use from the config file [env: BWS_PROFILE=]
  -u, --server-url <SERVER_URL>      Override the server URL from the config file [env: BWS_SERVER_URL=]
  -h, --help                         Print help
  -V, --version                      Print version
```


### `keyring`

This feature provides `sagecipher` and `keyring`, to enable you to encrypt/decrypt files in your container.

- [sagecipher](https://pypi.org/project/sagecipher/) provides an AES cipher, whose key is obtained by signing nonce data via SSH agent.
- [keyring](https://pypi.org/project/keyring/) is configured to use the keyring managed by sagecipher.

```jsonc
"features": {
    "ghcr.io/jon-hedgerows/decontainer-features/keyring:1": {}
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
