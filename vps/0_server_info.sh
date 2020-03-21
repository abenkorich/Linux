#!/bin/bash
# --------------------------------------------------------------------------------------
# Initial Date  :   01/04/2018  (dd/mm/yyyy)
# Author        :   BENKORICH Abdellah
# URL           :   https://www.abenkorich.com
# Email         :   abdellah.benkorich@gmail.com - hello@abenkorich.com
#
# Description   :   Bash script to install apache2
# Usage         :   Use 'curl' to run this script directly from Github.
# Command       :   curl -L https://raw.githubusercontent.com/abenkorich/Linux-webserver/master/0_server_info.sh | bash
#
# Credit        :   https://github.com/teddysun/lamp/blob/master/include/public.sh
# License       :   MIT license -> https://opensource.org/licenses/MIT
# Tested On     :   Ubuntu 16.04
# --------------------------------------------------------------------------------------

get_ip (){
  IP=$( wget -qO- -t1 -T2 ipinfo.io/ip )
  [ ! -z ${IP} ] && echo ${IP} || echo
}

get_os_info(){
    cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
    cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
    freq=$( awk -F: '/cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
    tram=$( free -m | awk '/Mem/ {print $2}' )
    swap=$( free -m | awk '/Swap/ {print $2}' )
    up=$( awk '{a=$1/86400;b=($1%86400)/3600;c=($1%3600)/60;d=$1%60} {printf("%ddays, %d:%d:%d\n",a,b,c,d)}' /proc/uptime )
    load=$( w | head -1 | awk -F'load average:' '{print $2}' | sed 's/^[ \t]*//;s/[ \t]*$//' )
    opsy=$( awk -F: '{print $2}' <<< $(lsb_release -d) )
    arch=$( uname -m )
    lbit=$( getconf LONG_BIT )
    host=$( hostname )
    kern=$( uname -r )
    ramsum=$( expr $tram + $swap )
}

display_os_info(){
    clear
    echo
    echo "+-------------------------------------------------------------------+"
    echo "| Auto Install LAMP(Linux + Apache + MySQL/MariaDB/Percona + PHP )  |"
    echo "| Website: https://lamp.sh                                          |"
    echo "| Author : Teddysun <i@teddysun.com>                                |"
    echo "+-------------------------------------------------------------------+"
    echo
    echo "--------------------- System Information ----------------------------"
    echo
    echo "CPU model            : ${cname}"
    echo "Number of cores      : ${cores}"
    echo "CPU frequency        : ${freq} MHz"
    echo "Total amount of ram  : ${tram} MB"
    echo "Total amount of swap : ${swap} MB"
    echo "System uptime        : ${up}"
    echo "Load average         : ${load}"
    echo "OS                   : ${opsy}"
    echo "Arch                 : ${arch} (${lbit} Bit)"
    echo "Kernel               : ${kern}"
    echo "Hostname             : ${host}"
    echo "IPv4 address         : $(get_ip)"
    echo
    echo "---------------------------------------------------------------------"
}

get_os_info
display_os_info
