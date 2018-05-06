#!/bin/bash
# --------------------------------------------------------------------------------------
# Initial Date  :   01/04/2018  (dd/mm/yyyy)
# Author        :   BENKORICH Abdellah
# URL           :   https://www.abenkorich.com
# Email         :   abdellah.benkorich@gmail.com - hello@abenkorich.com
#
# Description   :   Bash script for intial server setup
# Usage         :   Use 'curl' to run this script directly from Github.
# Command       :   curl -L https://gist.githubusercontent.com/abenkorich/--/raw | bash
#
# License       :   MIT license -> https://opensource.org/licenses/MIT
# Tested On     :   Ubuntu 16.04
# --------------------------------------------------------------------------------------
#

# Update Ubuntu Repos
echo "Updatig APT Repos"
apt-get update
clear
# Upgrade Ubuntu Installed Packages assuming yes to all requests
echo "Upgrading APT PAckages"
apt-get -y upgrade
clear
# New sudo user creation request
echo "Its recommanded to use another sudo user rathen than ROOT, do you want to create a Sudo User: Y/n"
# read answere
read -e run
if [ "$run" == n ] ; then
echo "Aborted by user"
exit
else
# read the user name
read -e uname
# Add user
adduser $uname
# Add user to sudoers groupe
usermod -aG sudo $uname
# switch to the new user
su - $uname
# create a trash dir to hold the deleted items fro mthis user
mkdir ~/.trash
# create new aliase to trash folder, good practis eincase of unwanted delete
alias rm="mv -t ~/.trash"
# creat .ssh for key login
mkdir ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
exit
clear
service ssh restart or systemctl reload sshd

fi
}
