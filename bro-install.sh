#!/bin/bash
apt-get update
apt-get install bison cmake flex g++ gdb make libmagic-dev libpcap-dev libgeoip-dev libssl-dev python-dev swig2.0 zlib1g-dev
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz
gzip -d GeoLiteCity.dat.gz
gzip -d GeoLiteCityv6.dat.gz
mv GeoLiteCity.dat /usr/share/GeoIP/GeoIPCity.dat
mv GeoLiteCityv6.dat /usr/share/GeoIP/GeoIPCityv6.dat
git clone --recursive git://git.bro.org/bro
cd bro
./configure && make && sudo make install
./etc/profile.d/3rd-party.sh
echo "export PATH=$PATH:/usr/local/bro/bin" > /etc/profile.d/3rd-party.sh
source /etc/profile.d/3rd-party.sh

echo "#############################################Please execute the following to complete the installation#############################################"
echo 'source /etc/profile.d/3rd-party.sh'
echo "###################################################################################################################################################"

echo "Please see https://www.digitalocean.com/community/tutorials/how-to-install-bro-on-ubuntu-16-04 from step 4 to complete the manual configuration"
echo "There are many steps that are required for the final configuration which are not covered her"
echo "I make no claim of ownership or copyright. All such rights are retained by the original creators as listed in the URL supplied. Addtionally I make no claims of the correct function of this script and you run this completely at your own risk."
