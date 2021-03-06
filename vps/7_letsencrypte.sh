#!/bin/bash
# --------------------------------------------------------------------------------------
# Initial Date  :   01/04/2018  (dd/mm/yyyy)
# Last Review   :   05/06/2020
# Author        :   BENKORICH Abdellah
# URL           :   https://www.abenkorich.com
# Email         :   abdellah.benkorich@gmail.com - hello@abenkorich.com
#
# Description   :   Bash script to install certbot from letsEncrypt
# Usage         :   Use 'curl' to run this script directly from Github.
# Command       :   curl -L https://gist.githubusercontent.com/abenkorich/--/raw | bash
#
# License       :   MIT license -> https://opensource.org/licenses/MIT
# Tested On     :   Ubuntu 16.04
#
# Good ref      :   https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-16-04
# |_            :   https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-16-04
# |_            :   https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04
# --------------------------------------------------------------------------------------
#

# Add the cerbot repo
sudo add-apt-repository ppa:certbot/certbot

# Always update & upgrade Apt

apt-get update | apt-get upgrade

# Install cerbot plugin for nginx
sudo apt-get install python-certbot-nginx

# install cerbot pluggin for appache
sudo apt-get install python-certbot-apache

# generate lets encrypt cert for website under lemp
sudo certbot --nginx -d example.com -d www.example.com

# expand exsiting to include sub domains
certbot -d example.com,subdomain.example.com,www.example.com --expand

# generate cert for websit eunder lamp
sudo certbot --apache -d example.com -d www.example.com

# in case of renewing
sudo certbot --nginx -d dzdstore.com -d www.dzdstore.com --force-renewal

# HTTPS traffic on port 443 is already allowed through the firewall. 
# After you set up HTTPS, you can optionally deny HTTP traffic on port 80:
ufw delete allow 80/tcp
