#!/bin/sh
set -e

# the version of pipx that comes with ubuntu is too old for the --global flag
# so install with pip
if [ -z $(which pip3) ]; then
    echo "Installing pip"
    apt-get -yqq update
    apt-get -yqq install python3-pip
fi
echo "Installing pipx"
pip3 install --break-system-packages pipx

# install keyring and sagecipher
# sagecipher lets us use an ssh key as a key for the keyring

echo "Installing keyring and sagecipher using pipx"

pipx install --global --include-deps sagecipher  # this also installs keyring
pipx inject --global sagecipher setuptools       # missing runtime dependency for sagecipher
