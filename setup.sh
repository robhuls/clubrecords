#!/usr/bin/env bash
# Add sudo user with the same public key as root
adduser hulsr
usermod -aG sudo hulsr
rsync --archive --chown=hulsr:hulsr ~/.ssh /home/hulsr

# Configure the firewall
ufw allow OpenSSH
ufw enable

# Setup the server
apt update
apt upgrade -y
apt install python3-venv
git clone https://github.com/robhuls/clubrecords.git

# Install a build environment for uwsgi
apt install -y -q build-essential python3-dev

# Install nginx as our webserver and allow it in the firewall
apt install -y nginx
ufw allow "Nginx Full"

# Create a virtual environment for the app
cd /root/clubrecords
python3 -m venv clubrecords-env
source /root/clubrecords/clubrecords-env/bin/activate
pip install -r requirements.txt

# Install uwsgi as server
pip install uwsgi
