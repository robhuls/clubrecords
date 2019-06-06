#!/usr/bin/env bash
# Setup the server
apt update
apt-upgrade
apt install python3-venv
git clone https://github.com/robhuls/clubrecords.git
cd clubrecords
python3 -m venv clubrecords-env
source ./clubrecords-env/bin/activate
