#!/usr/bin/env bash
# Setup the server
apt update
apt upgrade -y
apt install python3-venv
git clone https://github.com/robhuls/clubrecords.git

# Create a virtual environment for the app
cd /clubrecords
python3 -m venv clubrecords-env
source /clubrecords-env/bin/activate
pip install -r requirements.txt


