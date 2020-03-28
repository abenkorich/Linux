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

# Create a new website directory
sudo mkdir /var/www/"domain_name"

# Grant access to the created directory
sudo chown -R $USER:$USER /var/www/"domain_name"

# Create new site config file
sudo nano /etc/nginx/sites-available/"domain_name"

# Exmaple of a config file with min config
# Watch out, it is listning on port 80, so appache if existed has to listen on 8080 as proxy
# modifiy  /etc/apache2/ports.conf 
# Listen 80 -> Listen 8080
# sudo service apache2 restart before ngnx start or reload
server {
    listen 80;
    listen [::]:80 ipv6only=on;  # default_server; is optional

    root /var/www/your_domain;
    index index.php index.html index.htm;

    server_name "domain_name";

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
    }
}



# Enable th new website conf file 
sudo ln -s /etc/nginx/sites-available/"domain_name" /etc/nginx/sites-enabled/

# Test if the conf files fas no errors
sudo nginx -t

# Restart nginx to take effects
sudo systemctl reload nginx

# Good for troubleshooting - Start

# Check which port nginx is listning on
grep -r listen /etc/nginx/*

# Check who is listning on port 80
sudo lsof -i :80
sudo fuser -k 80/tcp

# Good for troubleshooting - End

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

# Enable Gzip Compression

# Most likely gzip is enabled on your server. If not, you can following codes in /etc/nginx/nginx.conf

	gzip on;
	gzip_disable "msie6";

	gzip_vary on;
	gzip_proxied any;
	gzip_comp_level 6;
	gzip_buffers 16 8k;
	gzip_http_version 1.1;
	gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;

# Most important lines are gzip on and gzip_types
