#!/bin/bash
# --------------------------------------------------------------------------------------
# Initial Date  :   21/03/2020  (dd/mm/yyyy)
# Author        :   BENKORICH Abdellah
# URL           :   https://www.bena.dev
# Email         :   a.benkorich@gmail.com - hello@bena.com
#
# Description   :   Bash script to Covert jpg, jpeg, png images to webp
# Usage         :   Use 'curl' to run this script directly from Github.
# Command       :   curl -L https://gist.githubusercontent.com/abenkorich/--/raw | bash
#
# License       :   MIT license -> https://opensource.org/licenses/MIT
# Tested On     :   Ubuntu 18.
#
# Good ref      :   https://www.digitalocean.com/community/tutorials/how-to-create-and-serve-webp-images-to-speed-up-your-website
#
# --------------------------------------------------------------------------------------
#


# Please install cwebp 
apt-get update
apt-get install cwebp

# Syntax: cwebp image.jpg -o image.webp

# create a bash file Ex: nano webp_converter.sh

# put the following in it

# Find all files with jpg and jpeg
find $1 -type f -and \( -iname "*.jpg" -o -iname "*.jpeg" \) \

# Excute the script in quotes
-exec bash -c '

# generate a var with current date
stamp=$(date +%d_%m_%Y);

# generate a file name exactly as current found one
webp_path=$(sed 's/\.[^.]*$/.webp/' <<< "$0");
echo "web_path: $webp_path";

# extract the path, excluding the file name and extension
dir_webp_path=$(dirname "${webp_path}");
echo "dir_webp_path: $dir_webp_path";

# create a new path as follow [current_date]/[source folder]
final_path="$stamp/$dir_webp_path";
echo "Final_path: $final_path";

# make the directory
mkdir -p $final_path;

if [ ! -f "$webp_path" ]; then
  cwebp -quiet "$0" -o "$stamp/$webp_path";
fi;' {} \;

# call the file like this: sh webp_converter.sh [folder_to_convert]
# the out put will be in a folder with current date, [current_date]/[folder_to_convert]
