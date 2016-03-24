#!/bin/bash

set -e

echo "==== Make Folder"

WEBUIPATH="$HOME/dev"
mkdir -p $WEBUIPATH

echo "==== Installing gohan WebUI"

cd $WEBUIPATH
git clone git@github.com:cloudwan/gohan_webui.git

echo "==== Installing gohan WebUI Done!"
