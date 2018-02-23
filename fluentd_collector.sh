#!/bin/bash

curl https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add -

# add treasure data repository to apt
echo "deb http://packages.treasuredata.com/$1/ubuntu/xenial/ xenial contrib" > /etc/apt/sources.list.d/treasure-data.list

# update your sources
apt-get update

# install the toolbelt
apt-get install -y td-agent
