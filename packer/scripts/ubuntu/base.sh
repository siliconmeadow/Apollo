#!/usr/bin/env bash
set -eux
set -o pipefail

echo `uname -r`

sudo apt-get -y install git curl libcurl3 bridge-utils bundler default-jre-headless unzip wget python-setuptools python-protobuf cgroup-bin ruby1.9.1 fail2ban
sudo easy_install pip

sudo pip install docker-py==1.1.0
