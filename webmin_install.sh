#!/bin/bash
################################################################################
# Script for installing Webmin on Ubuntu 16.04, 18.04 and 20.04 (could be used for other version too)
# Author: Anirban Dutta

if [ "$(whoami)" != 'root' ]; then
        echo "Please run this script as root user only! "
		echo "Use this command to switch to root user:   sudo -i "
        exit 1;
    fi

banner()
{
  echo "+-----------------------------------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                                                       |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+-----------------------------------------------------------------------+"
}

banner "Automatic Webmin Installation Started.
Please wait !!  This might take several minutes to complete !! "

sleep 7;


sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib"
sudo apt install webmin -y

