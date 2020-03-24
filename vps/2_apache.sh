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
# License       :   MIT license -> https://opensource.org/licenses/MIT
# Tested On     :   Ubuntu 16.04
#
# Good ref      :   https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-16-04
# |_            :   https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-16-04
# |_            :   https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04
# --------------------------------------------------------------------------------------
#

# Update Ubuntu Repos
# Tested - OK!
apt-get update

# Install apache2
apt-get -y install apache2 libapache2-mod-php

# allow full apache with the fire wall
sudo ufw allow 'Apache Full'

sudo nano /etc/apache2/sites-available/"domain_name"

# Example of a basic config file

<VirtualHost *:80>
        ServerAdmin 3awani.com@gmail.com
        ServerName 3awani.com
        ServerAlias www.3awani.com
        DocumentRoot /home/3awani.com/public_html

        <Directory /home/3awani.com/public_html/>
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        <IfModule mod_dir.c>
            DirectoryIndex index.php index.pl index.cgi index.html index.xhtml index.htm
        </IfModule>

</VirtualHost>


# Enable th new website conf file 
sudo ln -s /etc/nginx/sites-available/"domain_name" /etc/nginx/sites-enabled/

# give apahce ownership of the web directory
chown www-data:www-data /var/www/

# enable web site
a2ensite xxxx.conf

# disable web site
sudo a2dissite 000-default.conf

# stop apâche server
sudo systemctl stop apache2

# start apâche server
sudo systemctl start apache2

# restart apache
sudo systemctl restart apache2

# reload config wothout connection DROP
sudo systemctl reload apache2
