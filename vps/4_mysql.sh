#!/bin/bash
# --------------------------------------------------------------------------------------
# Initial Date  :   01/04/2018  (dd/mm/yyyy)
# Author        :   BENKORICH Abdellah
# URL           :   https://www.abenkorich.com
# Email         :   abdellah.benkorich@gmail.com - hello@abenkorich.com
#
# Description   :   Bash script for
# Usage         :   Use 'curl' to run this script directly from Github.
# Command       :   curl -L https://gist.githubusercontent.com/abenkorich/--/raw | bash
#
# License       :   MIT license -> https://opensource.org/licenses/MIT
# Tested On     :   Ubuntu 16.04
# --------------------------------------------------------------------------------------

# Update Ubuntu Repos
# Tested - OK!
apt-get update

# install appache
# Tested - OK!
apt-get install -y mysql-server mysql-client phpmyadmin

# Include "/etc/phpmyadmin/apache.conf" to /etc/apache2/apache2.conf To access throught http://IPADDRESS/phpmyadmin:
# Tested - OK!
sudo echo "/etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf

# restart server
# Tested - OK!
sudo service apache2 restart

# Get Mysql Status
# Tested - OK!
systemctl status mysql

# Secure Mysql installation
# Tested - OK!
mysql_secure_installation

# Put The MySql Credits in the Vars
ROOT_PASSWORD="" &&
DB_NAME="" &&
DB_USER="" &&
DB_USER_PASSWORD="@DO"

# run the same command silently
# Not Tested - Todo!
echo -e "\ny\ny\nabc\nabc\ny\ny\ny\ny" | ./usr/bin/mysql_secure_installation

# Change $ROOT_PASSWORD, $DB_NAME to create new Database
# Tested - OK!
mysql -uroot -p$ROOT_PASSWORD -h localhost -e "CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8";

# Change $ROOT_PASSWORD to show exsiting databases
# Tested - OK!
mysql -uroot -p$ROOT_PASSWORD -e "SHOW DATABASES";

# Change $ROOT_PASSWORD to drop exsiting databases
# Tested - OK!
mysql -uroot -p$ROOT_PASSWORD -h localhost -e "DROP DATABASE $DB_NAME";

# Change $ROOT_PASSWORD, $DB_USER, $DB_USER_PASSWORD to create new user
# Tested - OK!
mysql -uroot -p$ROOT_PASSWORD -e "CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '"$DB_USER_PASSWORD"'";

# Change $ROOT_PASSWORD, $DB_NAME to Grant preveleges to that user
# Tested - OK!
mysql -uroot -p$ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost'";

# Change $ROOT_PASSWORD, $DB_NAME to Create and Grant preveleges to that user
# Tested - OK!
mysql -uroot -p$ROOT_PASSWORD -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'localhost' identified by '$DB_USER_PASSWORD'";

mysql -uroot -p$ROOT_PASSWORD -e "GRANT GRANT INSERT, SELECT, DELETE, UPDATE ON $DB_NAME.* TO '$DB_USER'@'localhost' identified by '$DB_USER_PASSWORD'";
# Delete usermod
mysql -uroot -p$ROOT_PASSWORD -e "DROP USER IF EXISTS '$DB_USER'@'localhost'";

# Show granted
mysql -uroot -p$ROOT_PASSWORD -e "SHOW GRANTS FOR 'dzd_db_user1'@'localhost'";

# update hostname to the user
mysql -uroot -p$ROOT_PASSWORD -e "update mysql.user set host = 'localhost' where user = '' ";

# Change $ROOT_PASSWORD, $DB_NAME, FILE_NAME to import database from file
# Tested - OK!
mysql -uroot -p$ROOT_PASSWORD $DB_NAME < $FILE_NAME.sql



# Change $ROOT_PASSWORD to show exsiting databases
# Tested - OK!
mysql -uroot -p$ROOT_PASSWORD -e "SELECT User, Host FROM mysql.user";

# Change $ROOT_PASSWORD to show exsiting databases
# Tested - OK!
mysql -uroot -p$ROOT_PASSWORD -e "FLUSH PRIVILEGES";

# for password recovery
# Not Tested - Todo!
# |---------------------------------------------------------------|
mysql --version |  cut -b26-31
grep -r 'text goes here' file path
/etc/init.d/mysql stop;  #or systemctl stop mysql
killall mysqld
mkdir -p /var/run/mysqld | chown mysql /var/run/mysqld/
sudo mysqld_safe --skip-grant-tables --skip-networking &
enter
echo “Root PASSWORD: ”
read -e password
mysql -u root mysql ALTER USER 'root'@'localhost' IDENTIFIED BY $password; FLUSH PRIVILEGES;
or

mysql -u root mysql SET PASSWORD FOR 'root'@'localhost' = PASSWORD('new_password'); FLUSH PRIVILEGES;
# |---------------------------------------------------------------|
