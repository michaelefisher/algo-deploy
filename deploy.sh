#! /bin/bash

# Copy configs into place
echo "cp config.cfg algo/config.cfg"
cp config.cfg algo/config.cfg

# Make sure Digital Ocean Access Token is set
echo "Enter Digital Ocean Access Token followed by [ENTER]:"
read ACCESS_TOKEN
echo "Key entered: " $ACCESS_TOKEN

# Changing directory to algo/
echo "cd algo"
cd algo

# Run playbook command
echo "Running playbook commands"

ansible-playbook deploy.yml -t digitalocean,vpn,cloud,dns,adblock,security,ssh_tunneling -e "do_access_token=${ACCESS_TOKEN} do_server_name=algo do_region=nyc1 OnDemandEnabled_WIFI=Y OnDemandEnabled_WIFI_EXCLUDE=RZRG4 OnDemandEnabled_Cellular=Y"
