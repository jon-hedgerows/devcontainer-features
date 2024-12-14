#!/bin/sh
set -e

# we depend on python, so assume that pip is available

# install keyring and sagecipher
# sagecipher lets us use an ssh key as a key for the keyring

echo "Installing keyring and sagecipher using pip"

pip install --break-system-packages sagecipher
