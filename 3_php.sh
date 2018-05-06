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
# --------------------------------------------------------------------------------------
#

# Update Ubuntu Repos
# Tested - OK!
apt-get update

# install php related packeges
apt-get -y install php-mysql php-common php-mcrypt libapache2-mod-php

# install php packages
apt-get -y install php-cli php-fpm libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-zip php7.0-json php7.0-xml php7.0-mcrypt php7.0-gd

libapache2-mod-php
