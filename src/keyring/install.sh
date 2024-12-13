#!/bin/sh
set -e

echo "Install keyring and sagecipher using pipx"

# install keyring and sagecipher
# sagecipher lets us use an ssh key as a key for the keyring
pipx install --include-deps sagecipher  # this also installs keyring
pipx inject sagecipher setuptools # missing runtime dependency for sagecipher
