#!/bin/bash

set -e

NODE_VERSION="5.2.0"

echo "==== Download NVM"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

echo "==== Setup NVM"

source ${HOME}/.nvm/nvm.sh
echo "NVM_DIR=$HOME/.nvm" >> ${HOME}/.bashrc
echo "[ -s \"$NVM_DIR/nvm.sh\" ] && . \"$NVM_DIR/nvm.sh\"" >> ${HOME}/.bashrc

echo "==== Install nodejs"

nvm install v$NODE_VERSION
nvm use v$NODE_VERSION

echo "==== Update npm"

npm update -g npm

echo "==== Node setup Done!"
