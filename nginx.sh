#!/bin/bash
# --------------------------------------------------------------------------------------
# Initial Date  :   01/04/2018  (dd/mm/yyyy)
# Author        :   BENKORICH Abdellah
# URL           :   https://www.abenkorich.com
# Email         :   abdellah.benkorich@gmail.com - hello@abenkorich.com
#
# Description   :   Bash script to install apache2
# Usage         :   Use 'curl' to run this script directly from Github.
# Command       :   curl -L https://gist.githubusercontent.com/abenkorich/--/raw | bash
#
# Credit        :   https://github.com/teddysun/lamp/blob/master/include/public.sh
# License       :   MIT license -> https://opensource.org/licenses/MIT
# Tested On     :   Ubuntu 16.04
# Source        :   https://websiteforstudents.com/install-nginx-mariadb-and-php-7-1-lemp-with-ubuntu-16-04-lts-server/
# --------------------------------------------------------------------------------------

sudo apt install nginx

sudo systemctl stop nginx.service
sudo systemctl start nginx.service
sudo systemctl enable nginx.service

sudo apt-get install mariadb-server mariadb-client

sudo systemctl stop mysql.service
sudo systemctl start mysql.service
sudo systemctl enable mysql.service

sudo mysql_secure_installation

sudo systemctl restart mysql.service

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php

sudo apt update

sudo apt install php7.1-fpm php7.1-common php7.1-mbstring php7.1-xmlrpc php7.1-soap php7.1-gd php7.1-xml php7.1-intl php7.1-mysql php7.1-cli php7.1-mcrypt php7.1-zip php7.1-curl
sudo apt install php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-mcrypt php-ldap php-zip php-curl

sudo systemctl restart nginx.service
systemctl restart php7.1-fpm.service

sudo chown -R www-data:www-data www_dir
chmod -R 755  www_dir

nginx -t t verify

ln -s /etc/nginx/sites-available/*sitename /etc/nginx/sites-enabled/
