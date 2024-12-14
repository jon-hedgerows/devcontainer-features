#!/bin/sh
set -e

echo "Running:           $(readlink -f $0)"
echo "Working directory: $(pwd)"
echo "Container user:    ${_CONTAINER_USER}"
echo "Container user home: ${_CONTAINER_USER_HOME}"

echo "Installing pipx"
apt-get -yqq update
apt-get -yqq install pipx

echo "Installing keyring and sagecipher using pipx"

# install keyring and sagecipher
# sagecipher lets us use an ssh key as a key for the keyring
pipx install --global --include-deps sagecipher  # this also installs keyring
pipx inject --global sagecipher setuptools       # missing runtime dependency for sagecipher


# # configure the keyring
# KEYRING=sagecipher_pass.cfg
# WORKSPACEKEYRINGFOLDER=$WORKSPACE/.keyring
# WORKSPACEKEYRING=$WORKSPACE/.keyring/$KEYRING
# DEFAULTKEYRINGFOLDER=${_CONTAINER_USER_HOME}/.local/share/python_keyring
# DEFAULTKEYRING=$DEFAULTKEYRINGFOLDER/$KEYRING

# # create the workspace keyring if it doesn't exist
# if [ ! -d $WORKSPACEKEYRINGFOLDER ]; then
#     mkdir -p $WORKSPACEKEYRINGFOLDER
#     chown ${_CONTAINER_USER} ${WORKSPACEKEYRINGFOLDER}
# fi
# if [ ! -f $WORKSPACEKEYRING ]; then
#     touch $WORKSPACEKEYRING
#     chown ${_CONTAINER_USER} $WORKSPACEKEYRING
# fi

# # link the workspace keyring to the default location
# mkdir -p $DEFAULTKEYRINGFOLDER
# chown -R ${_CONTAINER_USER} ${_CONTAINER_USER_HOME}
# rm -f $DEFAULTKEYRING
# ln -s $WORKSPACEKEYRING $DEFAULTKEYRING 
