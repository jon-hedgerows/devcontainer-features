# Jon's Dev Container Features

This repository contains a collection of Dev Container features that I find useful.

I based this repo on the [devcontainers/feature-starter template](https://github.com/devcontainers/feature-starter) which came with the MIT License, so the content here is offered
under the same license.

## Contents

### `hello`

Running `hello` inside the built container will print the greeting provided to it via its `greeting` option.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/devcontainers/feature-starter/hello:1": {
            "greeting": "Hello"
        }
    }
}
```

```bash
$ hello

Hello, user.
```

### `color`

Running `color` inside the built container will print your favorite color to standard out.

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/devcontainers/feature-starter/color:1": {
            "favorite": "green"
        }
    }
}
```

```bash
$ color

my favorite color is green
```

