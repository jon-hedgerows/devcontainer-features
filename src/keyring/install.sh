#!/bin/bash
set -e
set -x

# we depend on python, so assume that pip is available

# install keyring and sagecipher
# sagecipher lets us use an ssh key as a key for the keyring

echo "Installing keyring and sagecipher using pip"

# --break-system-packages appears in later versions of pip, so
# try it and fall back to plain pip

if ! pip install --break-system-packages sagecipher ; then
    # pip install didn't work, try without --break-system-packages
    pip install sagecipher
fi
