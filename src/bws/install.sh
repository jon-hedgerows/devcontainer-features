#!/bin/bash
set -e
set -x

# install bitwarden secrets CLI from https://github.com/bitwarden/sdk-sm/releases

R="2.1.0"

echo "Installing Bitwarden Secrets Manager CLI v${R}"

# we need wget and unzip, so let's naively assume we're running a debian OS and just install them
apt-get -yqq update
apt-get -yqq install wget unzip

# source URLs:
# https://github.com/bitwarden/sdk-sm/releases/download/bws-v1.0.0/bws-aarch64-unknown-linux-gnu-1.0.0.zip
# https://github.com/bitwarden/sdk-sm/releases/download/bws-v1.0.0/bws-x86_64-unknown-linux-gnu-1.0.0.zip

# https://github.com/bitwarden/sdk-sm/releases/download/bws-v2.0.0/bws-x86_64-unknown-linux-gnu-2.0.0.zip
# https://github.com/bitwarden/sdk-sm/releases/download/bws-v2.0.0/bws-x86_64-unknown-linux-musl-2.0.0.zip
# https://github.com/bitwarden/sdk-sm/releases/download/bws-v2.0.0/bws-aarch64-unknown-linux-gnu-2.0.0.zip
# https://github.com/bitwarden/sdk-sm/releases/download/bws-v2.0.0/bws-aarch64-unknown-linux-musl-2.0.0.zip


zipfile=bws-$(uname -m)-unknown-linux-gnu-${R}.zip

test -f $zipfile && rm -rf $zipfile
wget https://github.com/bitwarden/sdk-sm/releases/download/bws-v${R}/$zipfile
unzip $zipfile
mv bws /usr/local/bin/bws
chmod a+rx /usr/local/bin/bws
rm -f $zipfile
