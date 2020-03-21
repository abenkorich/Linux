#!/bin/bash
#
# Author:         Benkorich Abdellah
# URL:            https://abenkorich.com
# Email:          abdellah.benkorich@gmail.com
#
# Description:    Bash script of common used ssh commands
# Usage:          Use 'curl' to run this script directly from Github.
# Command:        curl -L https://gist.githubusercontent.com/abenkorich/--/raw | bash
#

IP=ip=$(ping -c 1 $DOMAIN)
SUDO_USER=""
SSH_KEY_PATH="~/.ssh/--"
PORT=""

# generate 4096 bit rsa key pair
sudo ssh-keygen -t rsa -b 4096
# Connect to DO server using dedicated ssh key and port
sudo ssh $SUDO_USER@$IP   -i $SSH_KEY_PATH  -p $PORT
# copy the public certificate to server
sudo ssh-copy-id -i $SSH_KEY_PATH.pub $SUDO_USER@$IP
# Remove the server IP from known host file incase of config ch
sudo ssh-keygen -R $IP
