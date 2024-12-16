#!/bin/sh
set -e

# we depend on python, so assume that pip is available, but the options
# are different for <23.1 and >=23.1
vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if ((10#${ver1[i]:=0} > 10#${ver2[i]:=0}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

# install keyring and sagecipher
# sagecipher lets us use an ssh key as a key for the keyring

echo "Installing keyring and sagecipher using pip"

vercomp $(pip --version | awk '{print $2}') '23.1'
if [ $? -eq 2 ]; then
    pip install sagecipher
else
    pip install --break-system-packages sagecipher
fi
