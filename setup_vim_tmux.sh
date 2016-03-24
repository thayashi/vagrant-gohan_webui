#!/bin/bash

set -e

echo -e "Host gist.github.com\n\tStrictHostKeyChecking no\n" >> $HOME/.ssh/config

cd ${HOME}

git clone git@gist.github.com:562a5a0951f72bb67f97.git
cp ./562a5a0951f72bb67f97/.vimrc $HOME/

git clone git@gist.github.com:7ceb91ec7ec8dfac58ab.git
cp ./7ceb91ec7ec8dfac58ab/.tmux.conf $HOME/

mkdir -p ${HOME}/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
