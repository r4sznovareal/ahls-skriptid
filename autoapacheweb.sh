#!/bin/bash

# See skript paigaldab apache veebiserveri.

APACHE2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')

if [ $APACHE2 -eq 0 ]; then
	echo "Paigaldame apache2"
	apt install apache2 -y
	sed -i "s/Apache2 Debian Default Page/Minu lehekylg/g" /var/www/html/index.html
	echo "Apache on paigaldatud"

elif [ $APACHE2 -eq 1 ]; then
	echo "Apache on juba paigaldatud, kustutame ära"
	apt-get --purge remove apache* -y
	apt-get autoremove -y
	apt-get autoclean
	systemctl restart apache2
	systemctl status apache2
	echo "Apache on kustutatud"
fi
