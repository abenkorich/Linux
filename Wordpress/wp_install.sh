#!/bin/bash
#
# Author:         Benkorich Abdellah
# URL:            https://abenkorich.com
# Email:          abdellah.benkorich@gmail.com
#
# Description:    Bash script for --
# Usage:          Use 'curl' to run this script directly from Github.
# Command:        curl -L https://gist.githubusercontent.com/abenkorich/--/raw | bash
#
# Good examples
#https://gist.github.com/aamnah/30c596c3cdc96c1f1470
#https://gist.github.com/chrisjlee/3278562
#https://gist.github.com/bgallagh3r/2853221
#https://github.com/digitalocean/do_user_scripts/blob/master/Ubuntu-14.04/cms/wordpress-nginx.sh
#https://github.com/digitalocean/do_user_scripts/blob/master/Ubuntu-16.04/cms/wordpress.sh
#https://gist.github.com/aamnah/93cb63fc15e708649084
#https://gist.github.com/aamnah/8b5275fbd318f15ee8e4cbdd96b807c7

# for nginx
# https://websiteforstudents.com/install-opencart-on-ubuntu-17-04-17-10-with-nginx-mariadb-and-php/
#


#!/bin/bash

install_wp(){
clear
echo "======================================================================"
echo "Opencart Installation started "
echo "======================================================================"
echo "The Access Credentials are writen under /root/.dzd_wp_install_credit"
#store the input credentials in a secure file at /root/.dzd_wp_install_credit
echo -e $dbname'\n'$dbuser'\n'$dbpass >> /root/.dzd_wp_install_credit
#make a temporary directory to handle the install
mkdir -p ~/dzd_bot/wp | cd ~/dzd_bot/wp
#download wordpress
curl -O http://wordpress.org/latest.tar.gz
#unzip wordpress
tar -zxvf latest.tar.gz
#change dir to wordpress
cd wordpress
#copy file to parent dir
cp -rf wordpress/* .
#remove wordpress folder
rm -R wordpress
}

install_bot(){
clear
echo "======================================================================"
echo "The Bena Bot started installing your app "
echo "======================================================================"
echo “Please Type [ W ] for Wordpress installation”
read -e choise
if [ "$choise" == W ] ; then
install_wp
else
echo "Bad Choise, Do you want to start over? Y/N"
read -e choice
if [ "$choice" == y ] ; then
install_bot
else
exit
fi
fi
}

welcome (){
clear
echo "======================================================================"
echo "                      Bena Wordpress Install Script "
echo "======================================================================"
echo “Database Name: ”
read -e dbname
echo “Database User: ”
read -e dbuser
echo “Database Password: ”
read -s dbpass
echo “run install? y/n”
read -e run
if [ "$run" == n ] ; then
exit
else
install_bot
fi
}

welcome
