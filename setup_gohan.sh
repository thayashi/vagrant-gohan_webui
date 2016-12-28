#!/bin/bash

set -eu

# Common configuration
OS="linux"
ARCH="amd64"

# GO configuration
GO_VERSION="1.7"
GOPATH="$HOME/gocode"
GOHAN_PATH=$GOPATH/src/github.com/cloudwan

# Install Packages
PACKAGES=(
    "git" "mercurial" "screen"
    "python" "python-dev" "python-pip" "python-setuptools" "python-mysqldb" "python-pydot"
    "python-yaml" "python-lxml"
    "libssl-dev" "libffi-dev" "libsmbclient-dev" "libcups2-dev" "libyaml-dev"
    "libxml2-dev" "libxslt-dev" "libz-dev" "libyaml-cpp-dev"
    "build-essential" "bzr" "scons" "curl" "libcurl3" "rabbitmq-server" "selinux-utils"
#      "firefox" "Xvfb" "aufs-tools" "libpcre3-dev"
)

echo "==== Setting up host environment"

echo "==== Updating apt repositories"

sudo apt-get --quiet -y update

echo "==== Installing package dependencies"

sudo apt-get install -y ${PACKAGES[*]}

echo "==== Installing go"

cd /tmp

echo "Downloading go${GO_VERSION}.linux-amd64.tar.gz"

wget https://storage.googleapis.com/golang/go$GO_VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzf /tmp/go$GO_VERSION.$OS-$ARCH.tar.gz
cd ${HOME}
touch .gorc

echo "Setting up correct env. variables"
echo "export GOPATH=$GOPATH" >> $HOME/.gorc
echo "export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin" >> $HOME/.gorc
echo "source ${HOME}/.gorc" >> ${HOME}/.bashrc

mkdir -p $GOPATH
source ${HOME}/.gorc

echo "==== Installing gohan"

touch $HOME/.ssh/config
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> $HOME/.ssh/config

mkdir -p $GOHAN_PATH
cd $GOHAN_PATH

git clone git@github.com:cloudwan/gohan.git

cd gohan
make deps
make install

echo "====Installing gohan Done!"
